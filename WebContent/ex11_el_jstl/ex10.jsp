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
	<h1>set 사용</h1>
	<p>c:set 태그는 request.setAttribute의 메서드랑 똑같다고 생각하면 된다.</p>
	<c:set var="result" value="1"/>
	<c:forEach var="a" begin="1" end="10">
	<c:set var="result" value="${result*2}"/>
	2의 ${a }제곱 = ${result} <br />
	</c:forEach> 
	
</body>
</html>