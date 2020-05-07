<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String hak = request.getParameter("hak");
	ScoreDAO dao = new ScoreDAO();
	try{
		dao.deleteScore(hak);	
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("list.jsp?error=");
	}
	response.sendRedirect("list.jsp");
%>