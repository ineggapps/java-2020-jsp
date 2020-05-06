<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.calc.CalcVO"/>
<%
	//jsp:useBean은 CalcVO vo = new CalcVO(); 과 유사한 개념
%>
<jsp:setProperty property="*" name="vo"/>
<%--아래의 경우에는 VO클래의 필드 이름과 form태그의 이름이 다를 경우에는 수동으로 맞출 수도 있지만, 이런 식으로는 거의 사용되지 않는다. --%>
<%--property 클래스의 필드명 / param은 form태그의 name속성 값 --%>
<jsp:setProperty property="operator" name="vo" param="oper"/>
<%
	// vo.setNum1(Integer.parseInt(request.getParameter("num1")));
	// vo.setNum2(Integer.parseInt(request.getParameter("num2")));
	//그러나 oper은 넘어가지 않는다. class에는 operator이고 넘기는 파라미터의 이름은 oper이므로 다음의 값은 성립하지 않는다.
	// vo.setOperator(requeset.getParameter("oper")); //자동으로 삽입되지 않음.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<%=vo.getNum1()%> <br />
	<%=vo.getOperator() %> <br />
	<%=vo.getNum2() %><br />
</body>
</html>