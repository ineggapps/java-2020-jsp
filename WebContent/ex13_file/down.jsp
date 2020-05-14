<%@page import="java.io.File"%>
<%@page import="com.util.FileManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	String root = pageContext.getServletContext().getRealPath("/");
	String pathname = root + "uploads" + File.separator  + "pds";

	String save = request.getParameter("file1");
	String ori = request.getParameter("file2");

	boolean b = FileManager.doFiledownload(save, ori, pathname, response);
%>