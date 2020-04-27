<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//page contentType="text/html; charset=UTF-8" -> Servlet에서 resp.setContentType을 의미한다.
    //생략\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\java-2020-jsp\org\apache\jsp\ex
	// └ (work) 이클립스 workspace 폴더
	/*
	- java.lang.Object
		- javax.servlet.GenericServlet
			- javax.servlet.http.HttpServlet
				- org.apache.jasper.runtime.HttpJspBase
	*/    
	
	/*
	JSP가 실행되는 시점
	- 1. JSP는 최초 요청 시 딱 한 번 실행되어 서블릿으로 변환된다.
	- 2. 소스코드가 변경되었을 때
	*/
%>
<%
	int s = 0;
	//1에서
	/*100까지의*/
	/**합*/
	for (int n = 1; n <= 100; n++) {
		s += n;
	}
%>
<!-- HTML주석이다 -->
<%-- JSP 주석이다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	결과:	<%=s%>
</body>
</html>