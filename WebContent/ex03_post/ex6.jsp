<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h3>서버로 전송하는 방법 또 한 가지...</h3>
	<p>text객체가 하나면 엔터를 눌렀을 때 서버로 submit된다.</p>
	<form name="myForm" action="ex6_ok.jsp" method="post">
		<p>
			이름: <input type="text" name="name">
		</p>
	</form>
</body>
</html>