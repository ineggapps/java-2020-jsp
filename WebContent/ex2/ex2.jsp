<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script>
      function send() {
        var name = "자&바";
        var age = 20;
        // var query = "name=" + name + "&age=" + age; //&과 같은 특수 문자를 처리하지 않으면 문자로서의 &로 해석하지 않는다.
        //특히 IE의 경우에는 &문자열이 포함되면 400 오류가 발생한다.
        var query = "name=" +  encodeURIComponent(name) + "&age=" + age;
        var url = "ex2_ok.jsp?" + query;
        location.href = url;
      }
    </script>
  </head>
  <body>
    <h3>GET 방식으로 파라미터 전송</h3>
    <a href="ex2_ok.jsp?name=java&age=20">확인</a>
    <button type="button" onclick="send();">확인2</button>
  </body>
</html>
