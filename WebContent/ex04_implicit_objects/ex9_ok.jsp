<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	//request를 통해 받는 키에 대응하는 값은 무조건 String값이다.
	//따라서 숫자로 활용해야 하는 데이터는 임의로 숫자로 변환을 하는 것이지, 숫잣값 그대로를 받을 수는 없는 것이다.
	String name = request.getParameter("name");
	String subject =request.getParameter("subject");
	String score = request.getParameter("score");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<h3>파라미터 받기 - getParameter(String name)</h3>
	<p>이름: <%=name %></p>
	<p>과목: <%=subject %></p>
	<p>점수: <%=score %></p>
</body>
</html>