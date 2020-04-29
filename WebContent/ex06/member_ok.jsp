<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	String name = request.getParameter("userName");
	String birth = request.getParameter("birth");
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;
	
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1 + "-" + tel2 + "-" + tel3;
	
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addr = addr1 + addr2;
	
	String job = request.getParameter("job");
	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
  </head>
  <body>
    <div id="wrap">
      <table>
        <tr>
          <td>아이디</td>
          <td><%=id%></td>
        </tr>
        <tr>
          <td>패스워드</td>
          <td><%=pwd%></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><%=name%></td>
        </tr>
        <tr>
          <td>생년월일</td>
          <td><%=birth%></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><%=email%></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td><%=tel%></td>
        </tr>
        <tr>
          <td>우편번호</td>
          <td><%=zip%></td>
        </tr>
        <tr>
          <td>주소</td>
          <td><%=addr%></td>
        </tr>
        <tr>
          <td>직업</td>
          <td><%=job%></td>
        </tr>
      </table>
    </div>
  </body>
</html>
