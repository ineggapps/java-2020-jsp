<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<p>default locale: <%=response.getLocale() %></p>
	<p>default local with EL: ${pageContext.response.locale }</p>
	<p>
		<fmt:setLocale value="ko_KR"/>
	통화: <fmt:formatNumber value="12345.6789" type="currency"/>
	</p>
	<p>
		<fmt:setLocale value="en_US"/>
	통화: <fmt:formatNumber value="12345.6789" type="currency"/>
	</p>
	<p>
		<fmt:setLocale value="ja_JP"/>
	통화: <fmt:formatNumber value="12345.6789" type="currency"/>
	</p>   
	
	<p> 
	number:	<fmt:formatNumber value="12345.6789" type="number"/><br/>
	통화:	<fmt:formatNumber value="12345.6789" type="currency" currencySymbol="★"/><br/>
	percent: <fmt:formatNumber value="0.789" type="percent"/><br/>
	소숫점자리 제한:	<fmt:formatNumber value="12345.6789" pattern=".0"/><br/>
	pattern:	<fmt:formatNumber value="12345.6789" pattern="#,##0.0"/><br/>
	pattern:	<fmt:formatNumber value="2" pattern="#,###.0"/><br/>	
	pattern:	<fmt:formatNumber value="0.6789" pattern="#,###.0"/><br/>
	pattern:	<fmt:formatNumber value="0.6789" pattern="#,##0.0"/><br/>
	</p>
	
	<hr />
	<c:set var="now" value="<%=new java.util.Date() %>"/>
	<p>
		${now }<br/>
		date: <fmt:formatDate value="${now }" type="date"/><br/>
		time: <fmt:formatDate value="${now }" type="time"/><br/>
		both: <fmt:formatDate value="${now }" type="both"/><br/>
		full: <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/><br/>
	</p>
	
	
</body>
</html>