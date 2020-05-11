<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTf-8");
%>
<jsp:useBean id="vo" class="com.user.UserVO" />
<jsp:setProperty name="vo" property="*" />
<%
	String s = "성인";
	if (vo.getAge() < 19) {
		s = "미성년자";
	}
	request.setAttribute("result", s);
	request.setAttribute("vo", vo);
%>
<jsp:forward page="ex02_result2.jsp"/>