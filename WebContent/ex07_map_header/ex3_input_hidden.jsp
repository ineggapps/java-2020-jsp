<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
    <script>
      function send(o) {
        var f = document.forms[0];
		f.oper.value=o;
        f.submit();
      }
    </script>
  </head>
  <body>
    <form action="ex3_ok.jsp">
      <input type="text" name="num1" placeholder="수를 입력하세요" />
      <input type="text" name="num2" placeholder="수를 입력하세요" />
      <button type="button" onclick="send('+')">더하기</button>
      <button type="button" onclick="send('-')">빼기</button>
      <button type="button" onclick="send('*')">곱하기</button>
      <button type="button" onclick="send('/')">나누기</button>
      <input type="hidden" name="oper" />
    </form>
  </body>
</html>
