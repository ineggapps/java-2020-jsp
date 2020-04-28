<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String state = "성인";
    if(age<19){
        state = "미성년자";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3>GET 방식 파라미터 받기</h3>
    <p>이름: <%=name %></p>
    <p>나이: <%=age %>, <%=state %></p>
</body>
</html>