<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<%
	Cookie cookie = new Cookie("product3",URLEncoder.encode("노트북","utf-8"));
	response.addCookie(cookie);
%>
<body>
	<ul>
		<li>제품명: 노트북</li>
		<li>제조사: 엘디</li>
		<li>가격: 140</li>
		<li>설명: 구매해줘 제발</li>
	</ul>
	<div>
		<a href="shop.jsp">메인으로...</a>
	</div>
</body>
</html>