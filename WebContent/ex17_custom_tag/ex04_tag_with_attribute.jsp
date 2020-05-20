<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<my:header title="안녕???"/>
	<my:header title="안녕?" level="2"/>
	
	<my:header2>
		<jsp:attribute name="title">타이틀</jsp:attribute>
	</my:header2>
	
	<p>	<my:grade subject="java" score="99"/> </p>
	
	<p>
		<my:select name="city" seoul="서울" busan="부산" incheon="인천"/>
	</p>
	
</body>
</html>