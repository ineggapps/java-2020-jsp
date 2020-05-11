<%@page import="com.guest.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	GuestDAO dao = new GuestDAO();
	String paramPage = "";
	try {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("page");
		System.out.println(pageNum+"페이징...");
		if(pageNum!=null ){
			paramPage="?page="+pageNum;
		}
		dao.deleteGuest(num);
	} catch (Exception e) { 
		e.printStackTrace();
	}
	response.sendRedirect(cp + "/" + GuestDAO.FOLDER + "/" + GuestDAO.PAGE_GUEST + paramPage);
%>