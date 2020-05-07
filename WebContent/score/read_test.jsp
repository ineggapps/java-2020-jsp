<%@page import="com.score.ScoreDAO"%>
<%@page import="com.score.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	ScoreDAO dao = new ScoreDAO();
	ScoreDTO dto = dao.readScore("12345");
	
%>

<%=dto.toString()%>