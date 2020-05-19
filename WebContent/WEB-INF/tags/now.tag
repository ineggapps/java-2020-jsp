<%@tag import="java.util.Calendar"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%
	Calendar cal = Calendar.getInstance();
	String s = String.format("%1$tF %1$tT",cal);
%>
<%=s%>