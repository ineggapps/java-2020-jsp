<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%//스크립트릿 시작
	String method = request.getMethod();
	request.setCharacterEncoding("utf-8"); //post메서드를 사용할 때는 반드시 UTF-8로 인코딩하였다는 것을 코드로 명시해 주어야 한글을 인식할 수 있음.
	//클라이언트가 보낸 정보를 넘겨 받음
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	String state = "성인";
	if(age<19){
		state="미성년자";
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
	<h3>파라미터(query string) 받기</h3>
	<p>이름: <%=name %></p>
	<p>나이: <%=age %></p>
	<p><%=state %></p>
</body>
</html>