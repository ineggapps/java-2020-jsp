<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.member.MemberDTO"/>
<!-- useBean의 id속성과 setProperty의 name속성과 일치시켜야 한다. -->
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td><%=dto.getUserId() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=dto.getUserPwd() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=dto.getUserName() %></td>
		</tr>
		<tr>
			<td>생일</td>
			<td><%=dto.getBirth() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=dto.getEmail1() %>@<%=dto.getEmail2() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=dto.getTel1() %>-<%=dto.getTel2() %>-<%=dto.getTel3() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=dto.getZip()%> <%=dto.getAddr1() %> <%=dto.getAddr2() %></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%=dto.getJob() %></td>
		</tr>
	</table>
</body>
</html>