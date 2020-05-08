<%@page import="com.bbs.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.bbs.BoardDTO"/>
<jsp:setProperty name="dto" property="*" />
<%
	String pageNum = request.getParameter("page");
	BoardDAO dao = new BoardDAO();
	try{
		System.out.println(dto.toString());
		dto.setIpAddr(request.getRemoteAddr());
		dao.updateBoard(dto);		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect(cp + "/bbs/list.jsp?page="+pageNum);
//	response.sendRedirect(cp+"/bbs/list.jsp?num="+dto.getNum()+"&page="+pageNum);
%>