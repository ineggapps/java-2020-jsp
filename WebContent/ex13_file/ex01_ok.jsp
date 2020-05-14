<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	//enctype="multipart/form-data"로 form을 명시하면 getParameter 메서드로 받을 수 없게 된다.
	String name = request.getParameter("name");
	String subject= request.getParameter("subject");
	String upload = request.getParameter("upload");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>

	<p>이름: <%=name%></p>
	<p>제목: <%=subject%></p>
	<p>파일: <%=upload%></p>

</body>
</html>