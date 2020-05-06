<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h3>include 지시어</h3>
	<p>include 지시어를 사용하는 방법(but, 자주 사용하지 않음)</p>
	<%@include file="ex03_include.jsp" %>
	n: <%=n  %>
	
	중복선언은 되지 않는다. 왜냐하면 int n 변수가 두 번 선언되기 때문이다.
</body>
</html>