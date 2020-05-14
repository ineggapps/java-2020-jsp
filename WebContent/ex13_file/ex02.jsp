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
	<!-- enctype="multipart/form-data"라고 명시해야만 파일이 전송된다고 생각한다. -->
	<form action="ex02_ok.jsp" method="post" enctype="multipart/form-data">
		<p>이름: <input type="text" name="name"/></p>
		<p>제목: <input type="text" name="subject"/></p>
		<p>파일: <input type="file" name="upload"/></p>
		<p><button type="submit">확인</button></p>
	</form>
</body>
</html>