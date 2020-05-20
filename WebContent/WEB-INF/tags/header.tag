<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%--attribute로 넘어온 값은 ${}로 쓰면 된다... --%>
<%@ attribute name="title" required="true"%>
<%@ attribute name="level" type="Integer"%>
<%
	String s = null, e = null;
	if (level == null || level <= 1) {
		s = "<h1>";
		e = "</h1>";
	}
	else if (level>=6){
		s = "<h6>";
		e = "</h6>";
	}
	else{
		s = "<h" + level + ">";
		e = "</h" + level + ">";
	}
%>
<%=s%>${title}<%=e%>