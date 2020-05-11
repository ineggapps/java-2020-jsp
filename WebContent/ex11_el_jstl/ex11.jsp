<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h3>구글 홈페이지 실행 결과</h3>
	<c:import url="https://www.google.com" var="google"/>
	<div style="width:90%;border:1px solid red; margin:0 auto;">
		<c:out value="${google }" escapeXml="false"/>
	</div>
	<hr />
	<h3>네이버 홈페이지 소스 코드</h3>
	<c:import url="https://www.naver.com" var="naver"/>
	<div style="width:90%;border:1px solid red; margin:0 auto;">
		<c:out value="${naver }" escapeXml="true"/>
	</div>
	<h3>네이버 소스 실행 결과</h3>
	<c:import url="https://www.naver.com"/>
	<div style="width:90%;border:1px solid red; margin:0 auto;">
		<c:out value="${url}" escapeXml="false"/>
	</div>
	<hr />
</body>
</html>