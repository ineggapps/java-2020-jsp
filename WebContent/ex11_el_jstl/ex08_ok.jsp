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
	<c:forEach var="dto" items="${list }">
		${dto.num} | ${dto.name } | ${dto.subject } | ${dto.created } <br/>
	</c:forEach>
	<hr/>
	<c:forEach var="dto" items="${list }" varStatus="status">
		${status.index } | ${status.count } | ${status.first } | ${status.last } | 
		${dto.num} | ${dto.name } | ${dto.subject } <br/>
	</c:forEach>
	<hr/>
	
</body>
</html>