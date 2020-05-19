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
	<h3>세션 동작 원리</h3>
	<%--
		세션: 서버에 정보를 저장하는 것. (아이디, 권한 등을 저장)
		---------------------------------------------------
		서버에서는 클라이언트(브라우저)를 구분하여 세션을 저장해야 한다.
		서버에서는 클라이언트가 최초로 접속하면 클라이언트를 구분하기 위해서 JESSIONID를 쿠키의 형태로 보내준다. 
		---------------------------------------
		최초 요청 시 Response
		Set-Cookie: JSESSIONID=59269E83ED5E48E8BD8F97D99027C36C; Path=/java-2020-jsp; HttpOnly
		---------------------------------------
		2번째 요청 시: Request
		Cookie: JSESSIONID=59269E83ED5E48E8BD8F97D99027C36C
		---------------------------------------
	 --%>
	<p>isNew(): <%=session.isNew() %></p>
	<%--
		isNew()가 true라는 것은 최초 브라우저가 접속한 상태를 의미함.
	 --%>
	<hr />
	<p>쿠키 내용</p>
	<%
		Cookie[] cc = request.getCookies();
		if(cc!=null){
				for(Cookie c: cc){
					String name = c.getName();
					String value = c.getValue();
					out.print(name + ":" + value + "<br />");
				}
		}
	%>
</body>
</html>