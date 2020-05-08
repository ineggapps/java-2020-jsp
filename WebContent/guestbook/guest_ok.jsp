<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.guest.GuestDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String cp = request.getContextPath();
	GuestDAO dao = new GuestDAO();
	try{
		dao.insertGuest(dto);		
	}catch(Exception e){ 
		e.printStackTrace();
	}
	response.sendRedirect(cp + "/" + GuestDAO.FOLDER + "/" +GuestDAO.PAGE_GUEST);
%>