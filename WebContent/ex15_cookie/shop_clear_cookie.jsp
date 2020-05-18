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
	<%
		Cookie[] cc = request.getCookies();
		for(Cookie c: cc){
			if(c.getName().startsWith("product")){
				Cookie resetCookie = new Cookie(c.getName(), null);
				resetCookie.setMaxAge(0);
				response.addCookie(resetCookie);
			}
		}
	%>
	<p><a href="shop.jsp">돌아가기</a></p>
</body>
</html>