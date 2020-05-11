<%@page import="com.user.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	<h3>EL을 이용한 출력</h3>
	<div>request.setAttribute(항목명, 객체)를 이용하여 저장하는 것은 EL로 활용하기 위함이다. <br />VO클래스는 getter/setter메서드로 구성돼 있는데 이를 통해서 변수의 값을 받아올 수 있는 것이다. 따라서 getter/setter을 꼭 선언해 주어야 한다.</div>
	<p>${param.name }</p>
	<p>${vo.name}</p>
	<p>${vo.age }</p>
	<p>${result}</p>
</body>
</html>