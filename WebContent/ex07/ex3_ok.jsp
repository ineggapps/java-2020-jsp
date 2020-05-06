<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	int num1 = Integer.valueOf(request.getParameter("num1"));
	int num2 = Integer.valueOf(request.getParameter("num2"));
	String oper = request.getParameter("oper");
	
	String result= num1 + oper + num2 +" = ";
	switch(oper){
	case "+": 
		result += num1 + num2;
		break;
	case "-":
		result += num1 - num2;
		break;
	case "*":
		result += num1 * num2;
		break;
	case "/":
		result += num1 / num2;
		break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	결괏값: <%=result %>
</body>
</html>