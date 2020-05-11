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
	<h2>c:set</h2>
	<p>c:set 태그는 request.setAttribute의 메서드랑 똑같다고 생각하면 된다.</p>
	<c:set var="result" value="1"/>
	<c:forEach var="a" begin="1" end="10">
	<c:set var="result" value="${result*2}"/>
	2의 ${a }제곱 = ${result} <br />
	</c:forEach> 
	<hr />
	<h2>c:out</h2>
	<p>c:out 사용 예제. value 속성 안에 입력한 태그는 렌더링되지 않고 텍스트로 인식된다. <br /> escapeXml 속성을 지정하지 않으면 기본값은 true이다.</p>
	<c:out value="<p>jstl을 이용한 <strong>출력</strong>입니다.</p>"/>
	<hr />
	<h2>c:out</h2>
	<p>c:out 사용 예제. escapeXml="true"  태그는 렌더링되지 않고 텍스트로 인식된다.</p>
	<c:out value="<p>jstl을 이용한 <strong>출력</strong>입니다.</p>" escapeXml="true"/> 
	<hr />
	<h2>c:out</h2>
	<p>c:out 사용 예제. escapeXml="false"  태그는 렌더링된다.</p>
	<c:out value="<p>jstl을 이용한 <strong>출력</strong>입니다.</p>" escapeXml="false"/> 
	<hr />
	&lt;jsp:include&gt; 액션 태그는 실행 시 결괏값만 가져오는 것이다.
</body>
</html>