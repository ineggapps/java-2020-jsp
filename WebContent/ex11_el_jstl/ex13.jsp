<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h1>c:url 태그 사용</h1>
	<p><a href="/java-2020-jsp/bbs/list.jsp?condition=subject&search=&keyword=자바&page=3">3페이지</a></p>
	<h2>단점: c:url이 URL인코딩을 해주지 않는다.</h2>
	<p><a href="<c:url value='/bbs/list.jsp?condition=subject&search=&keyword=자바&page=3'/>">3페이지 c:url 사용</a></p>
	<hr />
	<h2>한글 인코딩을 하는 방법</h2>
	<h3>param태그를 이용</h3>
	<c:url var="url" value="/bbs/list.jsp">
		<%-- c:param태그를 사용해야만 자동으로 URL인코딩을 지원해 준다. --%>
		<c:param name="condition" value="subject"/>
		<c:param name="keyword" value="자바"/>
		<c:param name="page" value="3"/>
	</c:url>
	<p><a href="${url}">3페이지</a></p>

</body>
</html>