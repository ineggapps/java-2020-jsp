﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
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
<table style="width: 100%; border-spacing: 0;">
<tr height="45">
	<td align="left" class="title">
		<h3><span>|</span> 게시판</h3>
	</td>
</tr>
</table>

<table style="width: 100%; margin-top: 20px; border-spacing: 0;">
   <tr height="35">
      <td align="left" width="50%">
          ${dataCount }개(${page }/${totalPage} 페이지)
      </td>
      <td align="right">
          &nbsp;
      </td>
   </tr>
</table>

<table style="width: 100%; border-spacing: 0; border-collapse: collapse;">
  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="60" style="color: #787878;">번호</th>
      <th style="color: #787878;">제목</th>
      <th width="100" style="color: #787878;">작성자</th>
      <th width="80" style="color: #787878;">작성일</th>
      <th width="60" style="color: #787878;">조회수</th>
  </tr>
 
 <c:forEach var="dto" items="${list}">
  <tr align="center" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td>${dto.listNum}</td>
      <td align="left" style="padding-left: 10px;">
           <a href="${articleUrl}&amp;${dto.num}">${dto.subject}</a>
      </td>
      <td>${dto.name}</td>
      <td>${dto.created}</td>
      <td>${dto.hitCount }</td>
  </tr>
 </c:forEach>

</table>
 
<table style="width: 100%; border-spacing: 0;">
   <tr height="35">
	<td align="center">
		${dataCount==0? "등록된 게시물이 없습니다.":paging}
	</td>
   </tr>
</table>

<table style="width: 100%; margin-top: 10px; border-spacing: 0;">
   <tr height="40">
      <td align="left" width="100">
          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/cbbs/list.do';">새로고침</button>
      </td>
      <td align="center">
          <form name="searchForm" action="<%=cp %>/cbbs/list.do" method="post">
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
          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/cbbs/created.do';">글올리기</button>
      </td>
   </tr>
</table>
</div>

</body>
</html>