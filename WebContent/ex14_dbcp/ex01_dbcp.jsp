<%@page import="com.util.DBCPConn"%>
<%@page import="java.sql.Connection"%>
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
<body>
<%
	Connection conn = DBCPConn.getConnection();
	out.println(conn + "<br />");
	//번호, URL=jdbc:oracle:thin:@주소:포트:서비스명, UserName=계정명, Oracle JDBC driver
	DBCPConn.close(conn);//자원을 닫지 않으면 자원이 고갈될 때까지만 할당되고 닫히지 않은 자원 때문에 더는 새로운 자원을 할당받지 못한다.
%>
</body>
</html>