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
	<h3>EL 및 JSTL Map 접근</h3>
	<div>
		<h4>직접 key를 참조하여 가져오는 방법</h4>
		${map.name } | ${map.city} | ${map['tel'] }<br/>
	</div>
	<hr />
	<div>
		<h4>forEach를 사용하여 가져오는 방법</h4>		
		<c:forEach var="m" items="${map }">
			${m.key}  | ${m.value } <br/>
		</c:forEach>
	</div>
	<hr />
	<div>
		<h4>forEach를 사용하여 list 안에 담긴 map을 가져오는 방법</h4>		
		<c:forEach var="m" items="${list}"> 
			${m.name}  | ${m.subject} <br/>
		</c:forEach> 
	</div>
</body>
</html>