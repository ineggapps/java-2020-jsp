<%@page import="com.score.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%-- 이하 jsp: 액션 태그 2줄은 bean객체 생성하여 정보 주입하기 --%>
<jsp:useBean id="dto" class="com.score.ScoreDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	ScoreDAO dao = new ScoreDAO();
	try{
		dao.updateScore(dto);
	}catch(Exception e){
		//처리 안 하겠음...
	}
	response.sendRedirect("list.jsp");//리다이렉트...: insert, update, delete, 로그인, 로그아웃 작업 후 일반적으로 리다이렉트
	
%>