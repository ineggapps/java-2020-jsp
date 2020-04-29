<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");//POST방식에서는 꼭 필요한 구문. 하지만 메서드에 관계없이 무!조!건! 기술하도록 하자.
	
	//단수 개를 전달하는 파라미터도 얼마든지 배열로 받을 수 있다.
	String id = request.getParameter("id");
	//String[] ids = request.getParameterValues("id");
	String password =  request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String hak = request.getParameter("hak");
	//String hobby = request.getParameter("hobby"); //파라미터 이름이 동일하면 가장 앞선 하나의 값만 넘겨 받음.
	//String subject = request.getParameter("subject"); //파라미터 이름이 동일하므로 가장 앞선 하나의 값만 넘겨 받음.
	//그러므로 파라미터의 이름이 동일한 항목(checkbox, select multiple의 경우)
	String[] hh = request.getParameterValues("hobby");
	String hobby = "";
	if(hh!=null){
		for(String h: hh ){
			hobby += h + " ";
		}
	}
	String[] ss = request.getParameterValues("subject");
	String subject = "";
	if(ss!=null){
		for(String s: ss){
			subject += s + " ";
		}
	}
	String memo = request.getParameter("memo");
	memo = memo.replaceAll("\n", "<br />");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<p>아이디: <%=id %></p>
	<p>비밀번호: <%=password%></p>
	<p>이름: <%=name %></p>
	<p>성별: <%=gender %></p>
	<p>학력: <%=hak %></p>
	<p>취미: <%=hobby%></p>
	<p>과목: <%=subject%></p>
	<p>메모: <%=memo %></p>

</body>
</html>