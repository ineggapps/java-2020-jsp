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
	Cookie c1 = new Cookie("subject", null);
	c1.setMaxAge(0); //단위: 초
	response.addCookie(c1);
	
	//한글은 반드시 인코딩작업을 수행해야 함.
	Cookie c2 = new Cookie("name", null);
	//c2.setMaxAge(0); //기본값: 브라우저가 종료될 때 쿠키 제거
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("city", null);
	c3.setPath("/"); //setPath 설정한 것은 제거할 때도 동일하게 setPath 설정을 해주어야 한다.
	response.addCookie(c3);
	
%>
	<p><a href="ex01.jsp">돌아가기</a></p>
</body>
</html>