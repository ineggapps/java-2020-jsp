<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	//파라미터를 Map으로 받는 3번째 방법: 키(파라미터 이름), 값(파라미터 값)
	Map<String, String[]> map = request.getParameterMap();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<%
		Iterator<String> it = map.keySet().iterator();
	while(it.hasNext()){
		String key = it.next();
		String[] ss= map.get(key);
		if(ss!=null){
			for(String s: ss){
				out.print(key + ":" + s + "<br />");
			}
		}
	}
	%>
</body>
</html>