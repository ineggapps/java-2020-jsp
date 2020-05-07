<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[] haks = request.getParameterValues("haks");
	
	ScoreDAO dao = new ScoreDAO();
	try{
		dao.deleteScores(haks);	
	}catch(Exception e){
		e.printStackTrace();
		//response.sendRedirect("list.jsp?error=");
		return;
	}
	response.sendRedirect("list.jsp");
%> 