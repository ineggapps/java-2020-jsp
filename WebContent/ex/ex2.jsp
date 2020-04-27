<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%!//선언부(필드, 메서드 정의 영역) but 선언부는 jsp에서 사용해야 하는 경우가 거의 없다.
	public int sum(int n) {
		int s = 0;
		for (int i = 1; i <= n; i++) {
			s += n;
		}
		return s;
	}

	int x = 0;%>
<%
	//스크립트릿(메서드 안에 들어오는 소스 코드를 의미한다. _jsp_service() 메서드 안...)
	//당연히 메서드 안에 메서드를 선언할 수 없겠지 😅
	int s;
	s = sum(50);
	int y = 0;
	x++;
	y++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<p>결과: <%=s %></p>
	<p>x: <%=x %></p>
	<p>y: <%=y %></p>	
	<p><br/><br/><br/><br/>
⎛⎝⎛° ͜ʖ°⎞⎠⎞</p>
</body>
</html>