<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if (id.equals("test") && pwd.equals("test")) {
	session.setAttribute("id", id);
	session.setAttribute("name", "김자바");
	response.sendRedirect("ex01_session.jsp");
	return;
}
request.setAttribute("msg", "아이디 또는 패스워드 정확히");
%>
<jsp:forward page="ex01_session.jsp"/>