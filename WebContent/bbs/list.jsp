﻿<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.MyCustomUtil"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.bbs.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("utf-8");   

   MyUtil myUtil = new MyUtil();
   BoardDAO dao = new BoardDAO();
   
   //파라미터로 넘어온 페이지 번호(page: JSP 예약어로 변수명 사용이 불가능함.)
   String pageNum = request.getParameter("page");
   int current_page = 1;
   if(pageNum!=null){
	   current_page = Integer.parseInt(pageNum);
   }
   
   //검색
   String condition = request.getParameter("condition");
   String keyword = request.getParameter("keyword");
   if(condition==null){//검색으로 조회하는 것이 아니라면 기본 설정으로 세팅
	   condition="subject";
	   keyword="";
   }
   if(request.getMethod().equalsIgnoreCase("GET")){//GET방식에 한하여 디코딩을 수행
	   keyword=URLDecoder.decode(keyword,"UTF-8");
   }
   
   //전체 데이터 개수
   int dataCount;
   	//검색일 경우와 그렇지 않은 경우 나누어서 카운트.
   dataCount = keyword.length()==0?dao.dataCount():dao.dataCount(condition, keyword);
   
   //전체 페이지 수
   int rows = 10;//한 페이지에 표시할 게시글 수
   int total_page = myUtil.pageCount(rows, dataCount);
   //전체 페이지보다 표시할 현재 페이지가 클 경우(웹은 정적이므로 다른 사람이 삭제하여 데이터의 개수가 바뀐 경우 감지할 수 없음.)
   //☢ 게시판을 이용하는 타 사용자가 게시판의 글을 삭제할 경우 현재 게시글이 있는 페이지는 5p였지만 3p가 될 수도 있는 것이다. 
   if(current_page > total_page){
	   current_page = total_page;
   }

   //테이블에서 가져올 시작과 끝 위치
   int start = (current_page-1)*rows+1;
   int end = current_page * rows;
   
   List<BoardDTO> list;
   if(keyword.length()==0){//검색이 아닌 일반적인 경우
	   list = dao.listBoard(start, end);
   } else {//검색일 경우
	   list = dao.listBoard(start, end, condition, keyword);
   }
   
   //페이징 처리
   String query = "";
   if(keyword.length()!=0){
	   query="condition="+condition+"&keyword="+URLEncoder.encode(keyword,"UTF-8");
   }
   String listUrl = cp+"/bbs/list.jsp";
   String articleUrl = cp+"/bbs/article.jsp?page="+current_page;
   if(query.length()!=0){
		listUrl += "?" + query;	   
		articleUrl += "&" + query;
   }
   String paging = myUtil.paging(current_page, total_page, listUrl);
   
   MyCustomUtil myCustomUtil = new MyCustomUtil();
	String cn = listUrl.indexOf("?") >= 0 ? "&amp;" : "?";
	int[] pages = myCustomUtil.paging(current_page, total_page, listUrl);
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
*{
    margin:0; padding: 0;
}
ul, li {
	list-style-type: none;
	padding: 0 none;
}

ul.paging li {
	display: inline-block;
	padding: 0 5px;
}

span.on{
	font-weight:bold;
	color:tomato;
}

body {
    font-size:14px;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}
a{
    color:#000000;
    text-decoration:none;
    cursor:pointer;
}
a:active, a:hover {
    text-decoration: underline;
    color:tomato;
}
textarea:focus, input:focus{
    outline: none;
}
.btn {
    color:#333333;
    font-weight:500;
    font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
    border:1px solid #cccccc;
    background-color:#ffffff;
    text-align:center;
    cursor:pointer;
    padding:3px 10px 5px;
    border-radius:4px;
}
.btn:active, .btn:focus, .btn:hover {
    background-color:#e6e6e6;
    border-color:#adadad;
    color:#333333;
}
.boxTF {
    border:1px solid #999999;
    padding:3px 5px 5px;
    border-radius:4px;
    background-color:#ffffff;
    font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.selectField {
    border:1px solid #999999;
    padding:2px 5px 4px;
    border-radius:4px;
    font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.title {
    font-weight:bold;
    font-size:16px;
    font-family:나눔고딕, "맑은 고딕", 돋움, sans-serif;
}
</style>
<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.action="<%=listUrl%>";
	f.submit();
}
</script>
</head>

<body>
<div style="width: 700px; margin: 30px auto;">
<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
<tr height="45">
	<td align="left" class="title">
		<h3><span>|</span> 게시판</h3>
	</td>
</tr>
</table>

<table style="width: 100%; margin-top: 20px; border-spacing: 0; border-collapse: collapse;">
   <tr height="35">
      <td align="left" width="50%">
         <%=dataCount%>개(<%=current_page%>/<%=total_page%> 페이지)
      </td>
      <td align="right">
          &nbsp;
      </td>
   </tr>
</table>

<table style="width: 700px; margin: 0px auto; border-spacing: 0; border-collapse: collapse;">
  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="60" style="color: #787878;">번호</th>
      <th style="color: #787878;">제목</th>
      <th width="100" style="color: #787878;">작성자</th>
      <th width="80" style="color: #787878;">작성일</th>
      <th width="60" style="color: #787878;">조회수</th>
  </tr>
  
 <% for(BoardDTO dto: list){ %>
  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td><%=dto.getNum()%></td>
      <td align="left" style="padding-left: 10px;">
           <a href="<%=articleUrl%>&amp;num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
      </td>
      <td><%=dto.getName()%></td>
      <td><%=dto.getCreated()%></td>
      <td><%=dto.getHitCount()%></td>
  </tr>
<%} %>
</table>
 
<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
   <tr height="35">
	<td align="center">
       <%--paging --%> 
       <%if(dataCount>0){ %>
       <ul class="paging">
			<%
				if(pages[0]>1){%>
					<li><a href="<%=listUrl%><%=cn%>page=1">처음</a></li>
			<%}
			%>
			<%
				if(pages[0]>2){%>
					<li><a href="<%=listUrl%><%=cn%>page=<%=pages[0]-1%>">이전</a></li>
			<%	}%>						
			<%
				for (int i = 0; i < pages.length; i++) {
				if (current_page == pages[i]) {
			%>
				<li><span class="on"><%=pages[i]%></span></li>
			<%
				} else {
			%>
				<li><a href="<%=listUrl%><%=cn%>page=<%=pages[i]%>"><%=pages[i]%></a></li>
			<%  
				}
			}
			%>
			<%
				if(current_page+1<pages[pages.length-1]){%>
					<li><a href="<%=listUrl%><%=cn%>page=<%=pages[pages.length-1]+1%>">다음</a></li>
			<%	}
			%>
			<%
				if(pages[pages.length-1]<total_page){%>
					<li><a href="<%=listUrl%><%=cn%>page=<%=total_page%>">끝</a></li>
			<%}%>
		</ul>
		<%} else{%>
			등록된 게시물이 없습니다.
		<% } %>
	</td>
   </tr>
</table>

<table style="width: 100%; margin-top: 10px; border-spacing: 0; border-collapse: collapse;">
   <tr height="40">
      <td align="left" width="100">
          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/list.jsp';">새로고침</button>
      </td>
      <td align="center">
          <form name="searchForm" action="" method="post">
              <select name="condition" class="selectField">
                  <option value="subject">제목</option>
                  <option value="name">작성자</option>
                  <option value="content">내용</option>
                  <option value="created">등록일</option>
            </select>
            <input type="text" name="keyword" class="boxTF">
            <button type="button" class="btn" onclick="searchList()">검색</button>
        </form>
      </td>
      <td align="right" width="100">
          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/bbs/created.jsp';">글올리기</button>
      </td>
   </tr>
</table>
</div>

</body>
</html>