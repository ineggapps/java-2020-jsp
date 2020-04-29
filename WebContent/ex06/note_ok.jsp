<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	String[] users = request.getParameterValues("itemRight");
	String msg = request.getParameter("msg");
	
	String s ="";
	if(users!=null){
		for(String id:users){
			s+=id+" ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<p>받는사람: <%=s%></p>
	<p>메시지....</p>
	<pre><%=msg %></pre>
</body>
</html>