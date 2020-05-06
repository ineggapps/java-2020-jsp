<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
      }
      body {
        font-family: "맑은 고딕", "돋움";
      }
      a {
        cursor: pointer;
        text-decoration: none;
      }
      a:hover,
      a:active {
        color: tomato;
        text-decoration: underline;
      }
      #main-layout {
        width: 800px;
        margin: 20px auto 5px;
      }
      #header {
        height: 35px;
        line-height: 35px;
        text-align: center;
        border: 1px solid #ccc;
      }
      #header li {
        float: left;
        list-style: none;
        margin: 0;
        padding: 0;
        padding-left: 20px;
        padding-right: 20px;
      }

      .menuItem {
        display: inline-block;
        color: #333;
        text-decoration: none;
      }

      .menuItem:hover {
        color: #333;
        text-decoration: none;
        font-weight: 700;
      }

      #body-content {
        clear: both;
        min-height: 500px;
        padding: 5px;
      }

      #footer {
        height: 35px;
        line-height: 35px;
        text-align: center;
      }
    </style> 
  </head>
  <body>
    <div id="main-layout">
      <div id="header">
        <%-- 액션 태그는 실행한 결괏값을 참조하는 것이다. (소스 자체를 이어 붙이는 개념이 아님!!)
        --%>
        <jsp:include page="header.jsp" />
      </div>
      <div id="body-content">
        <h3>메인화면</h3>
        <p>include 액션태그는 실행된 결과를 포함한다.</p>
      </div>
      <div id="footer">
        <%-- 액션 태그는 실행한 결괏값을 참조하는 것이다. (소스 자체를 이어 붙이는 개념이 아님!!)
        --%>
        <jsp:include page="footer.jsp" />
      </div>
    </div>
  </body>
</html>
