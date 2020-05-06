<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%--Tomcat 7.0부터는 입력하지 않아도 문제가 발생하지 않는다.--%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
 	<p>실행 중 오류 발생...</p> 
 	
 	<p><%=exception.getClass().getName() %></p>
 	<p><%=exception.toString() %></p>
 	<p><%=exception.getMessage() %></p>
</body>
</html>