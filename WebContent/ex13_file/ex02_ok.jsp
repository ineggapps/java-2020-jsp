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
	//form 태그에서 enctype="multipart/form-data"로 명시하면 getParameter 메서드로 받을 수 없게 된다.
	String contentType = request.getContentType();
	out.println("<p>contentType: "+contentType+"</p>");
	out.println("<hr />");
	out.println("<h3>request로 넘어온 데이터</h3>");
	
	InputStream is = request.getInputStream();
	byte[] b = new byte[1024];
	int size;
	String s;
	while((size = is.read(b))!=-1){
		//#1. contentType:application-www-urlencoded
		//이렇게 넘어왔을 경우에만 request.getParatmer("매개변수명"); 으로 받을 수 있다.
		//s = new String(b, 0, size);
		//s = URLDecoder.decode(s, "UTF-8");
		
		//#2. contentType:multipart/form-data인 경우
		s = new String(b, 0, size, "utf-8");
		out.println(s+"<br>");

		
		//////////////////////////////////// 파일처리 사용 방법 //////////////////////////////////////
		//1. Apache Commons FileUpload 이용한 파일
		//2. COS 라이브러리 사용
		//3. 서블릿3.0(톰캣7.0부터)에서 자체적으로 서블릿에서 파일을 업로드한 것을 다운로드받을 수 있음.
		///////////////////////////////////////////////////////////////////////////////////////////
	}
%>
</body>
</html>