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
   
   //전체 데이터 개수
   int dataCount;
   dataCount = dao.dataCount();
   
   //전체 페이지 수
   int rows = 10;//한 페이지에 표시할 게시글 수
   int total_page = myUtil.pageCount(rows, dataCount);
   //전체 페이지보다 표시할 현재 페이지가 클 경우(웹은 정적이므로 다른 사람이 삭제하여 데이터의 개수가 바뀐 경우 감지할 수 없음.)
   if(current_page > total_page){
	   current_page = total_page;
   }

   //테이블에서 가져올 시작과 끝 위치
   int start = (current_page-1)*rows+1;
   int end = current_page * rows;
   
   List<BoardDTO> list;
   list = dao.listBoard(start, end);
   
   //페이징 처리
   String listUrl = cp+"/bbs/list.jsp";
   String article = cp+"/bbs/article.jsp?page="+current_page;
   String paging = myUtil.paging(current_page, total_page, listUrl);
   
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
      	<%if(dataCount>0){ %>
         <%=dataCount%>개(<%=current_page%>/<%=total_page%> 페이지)
         <%}else{ %>
         게시글이 없습니다.
         <%} %>
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
           <a href="<%=cp%>/bbs/article.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
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
       <%=paging %>
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