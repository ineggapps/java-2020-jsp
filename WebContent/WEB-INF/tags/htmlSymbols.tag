<%--몸체가 있는 태그 생략하지 않고 선언한 경우 --%>
<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ attribute name="trim" %>
<jsp:doBody var="content" scope="page"/>
<%
	String content = (String)jspContext.getAttribute("content");
	if(trim!=null && trim.equals("true")){
		content = content.trim();
	}
	
	//&를 치환할 때 가장 먼저 바꾸어 주어야 한다.
	content = content.replaceAll("&", "&amp;");
	content = content.replaceAll("\"", "&quot;");
	content = content.replaceAll("<", "&lt;");
	content = content.replaceAll(">", "&gt;");
	content = content.replaceAll("\n", "<br/>");
	//공백도 엔터로 인식하므로 치환할 때 순서를 지켜야 한다.
	content = content.replaceAll("\\s", "&nbsp;");
	
%>
<%=content %>
