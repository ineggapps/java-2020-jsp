<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	//톰캣에서 문제가 발생하지 않을 수 있지만 실무에서는 문제가 발생하므로
	//GET 방식으로 파라미터를 넘겨 받을 때는 반드시 한글의 경우 디코딩해야 한다.
	String name = request.getParameter("name");
	name = URLDecoder.decode(name, "utf-8");//디코딩 작업
	int age = Integer.parseInt(request.getParameter("age"));
	String state = "성인";
	if (age < 19) {
		state = "미성년자";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<h3>GET 방식 파라미터 받기</h3>
	<p>
		이름:
		<%=name%></p>
	<p>
		나이:
		<%=age%>,
		<%=state%></p>
</body>
</html>