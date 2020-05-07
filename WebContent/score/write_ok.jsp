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
		dao.insertScore(dto);
	}catch(Exception e){
		e.printStackTrace();
		//오류가 발생하는 경우(클라이언트 과실)
		//#1. 기본키가 중복되는 경우 (이미 학번이 등록된 경우 ORA-00001 예외를 받는다.)
		response.sendRedirect("write.jsp");
		return;
	}
	response.sendRedirect("list.jsp");//리다이렉트...: insert, update, delete, 로그인, 로그아웃 작업 후 일반적으로 리다이렉트
	
%>