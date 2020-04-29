<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-size: 14px;
	font-family: 맑은 고딕, 돋움;
}
.btn {
	 color:#333;
 	 font-weight:500;
	 font-family: 맑은 고딕, 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 text-align: center;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
.boxTF {
	border:1px solid #999;
	padding:4px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: 맑은 고딕, 돋움, sans-serif;
}
</style>

<script type="text/javascript">
function sendOk() {

}
</script>

</head>
<body>

<div style="width: 500px; margin:30px auto 5px;">
	<h3>| 인사관리</h3>
	
	<form name="insaForm" action="insaEx_ok.jsp" method="post">
	<table border="1" style="width: 100%; margin-top:7px; border-spacing: 0; border-collapse: collapse;">
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">이름</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="name" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">생년월일</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="birth" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">전화번호</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="phone" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">기본급</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="salary" class="boxTF">
		   </td>
		</tr>
		<tr height="35">
		   <td width="100" align="right" style="padding-right: 5px">수당</td>
		   <td width="300" style="padding-left: 10px">
		         <input type="text" name="bonus" class="boxTF">
		   </td>
		</tr>
	</table>
	
	<table style="width: 100%; margin-top:10px; border-spacing: 0;border-collapse: collapse;">
	<tr height="40" align="center">
	   <td><input type="button" value=" 등록하기 " class="btn" onclick="sendOk();"></td>
	</tr>
	</table>
	</form>
</div>

</body>
</html>