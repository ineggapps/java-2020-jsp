<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStream"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>

<%
	String contentType = request.getContentType();
	out.println("<p>contentType: "+contentType+"</p>");
	out.println("<hr />");
	out.println("<h3>request로 넘어온 데이터</h3>");
	
	InputStream is = request.getInputStream();
	byte[] b = new byte[1024];
	int size;
	String s;
	while((size = is.read(b))!=-1){
		s = new String(b, 0, size);
		s = URLDecoder.decode(s, "UTF-8");
		out.println(s+"<br>");
	}
	
%>

</body>
</html>