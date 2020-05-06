<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	//인터넷 익스플로러에서는 Redirect되지 않고 자체적인 익스플로러의 오류 페이지를 표시해 준다. 
	//따라서 개발자가 작성한 오류 페이지를 출력하도록 설정해야 한다.
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<p>잠시 후 다시 시도하세요...</p>
</body>
</html>