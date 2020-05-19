<%@page import="java.util.ArrayList"%>
<%@page import="com.tag.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--------------------------------------------------------------------------------- --%>
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%
	List<User> list = new ArrayList<>();
	list.add(new User("홍길동", 33));
	list.add(new User("김길동",27));
	list.add(new User("박길동",74));
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h1>커스텀 태그</h1>
	<my:hello/><br/>
	1~1000까지의 합 <my:sum num="1000"/>
	<hr />
	<h2>forEach</h2>
	<my:forEach begin="1" end="5" var="n">${n} 번째<br/></my:forEach>
	<hr />
	<my:forEach begin="5" end="1" step="-1" var="n">${n} 번째<br/></my:forEach>
	<!-- 올바르지 않은 예 아래에 -->
	<hr />
	<h2>실행되지 않음</h2>
	<my:forEach begin="5" end="10" step="-1" var="n">${n} 번째<br/></my:forEach>
	<hr />
	<h2>forEach2 (List)</h2>
	<my:forEach2 var="dto" items="${list}">
		<p>${dto.name} | ${dto.age}</p>
	</my:forEach2>
</body>
</html>