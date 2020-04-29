<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
  </head>
  <style type="text/css">
    #wrap {
      width: 500px;
      margin: 0 auto;
    }
    #wrap table {
      width:100%;
      border-spacing: 0;
      border-collapse: collapse;
      margin: 0 auto;
    }
    #wrap table td {
      padding: 10px;
      border: 1px solid #d9d9d9;
    }

    #wrap button {
      background-color: #fff;
      border: 1px solid #d0d0d0;
    }

    #wrap .control {
      text-align: center;
    }
  </style>
  <script>
  	function send(){
  		const f = document.myForm;
  		f.submit();
  	}
  </script>
  <body>
    <div id="wrap">
    	<form action="insa_ok.jsp" method="post" name="myForm">
	      <table>
	        <tr>
	          <td>이름</td>
	          <td><input type="text" name="name" /></td>
	        </tr>
	        <tr>
	          <td>생년월일</td>
	          <td><input type="text" name="birth" /></td>
	        </tr>
	        <tr>
	          <td>전화번호</td>
	          <td><input type="text" name="phone" /></td>
	        </tr>
	        <tr>
	          <td>기본급</td>
	          <td><input type="text" name="salary" /></td>
	        </tr>
	        <tr>
	          <td>수당</td>
	          <td><input type="text" name="bonus" /></td>
	        </tr>
	      </table>
	      <p class="control"><button type="button" onclick="send();">등록하기</button></p>
    	</form>
    </div>
  </body>
</html>
