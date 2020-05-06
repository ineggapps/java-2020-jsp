<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	//redirect된 페이지는 request가 초기화되어 redirect 전에 요청한 정보는 가지고 있지 않다.
	String subject = request.getParameter("subject");//null
	String score = request.getParameter("score");//null
	//page는 JSP의 예약어이다...
	String pageNum = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h3>redirect된 웹 페이지</h3>
	<p>subject: <%=subject %></p>
	<p>score: <%=score %></p>
	<p>page: <%=pageNum %></p>
	<p>일반적으로 DB에 insert, update, delete하거나<br/>
	로그인 후,로그아웃 후에 redirect한다.</p>
</body>
</html>