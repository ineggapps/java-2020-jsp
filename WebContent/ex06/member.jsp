<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

a{
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: tomato;
}

.btn {
	color:#333333;
	font-weight:500;
	border:1px solid #cccccc;
	background-color:#fff;
	text-align:center;
	cursor:pointer;
	padding:3px 10px 5px;
	border-radius:4px;
}
.btn:active, .btn:focus, .btn:hover {
	background-color:#e6e6e6;
	border-color: #adadad;
	color: #333333;
}
.boxTF {
	border:1px solid #999999;
	padding:4px 5px 5px;
	border-radius:4px;
	background-color:#ffffff;
}
.selectField {
	border:1px solid #999999;
	padding:2px 5px 6px;
	border-radius:4px;
	font-size: 12px;
}

.member {
	width: 600px; margin: 30px auto 0px;
}

.title {
	width:100%;
	height:45px;
	line-height:45px;
	font-weight: bold;
	font-size:15px;
}

.member-body {
	margin-top: 5px;
}

.member-body table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

.member-body .list-row-2 {
	height: 40px;
	border-top: 2px solid #507CD1;
}

.member-body .list-row-1 {
	height: 40px;
	border-top: 1px solid #cccccc;
}
</style>
<script>


	function sendOk(){
		var f = document.memberForm;
		//quiz1. 아이디 스크립트로 검사하기 (원하는 정규식 이용)
		//조건. 아이디는 5~10자, 영문자로 시작하며 중간에는 영문자, 숫자, _만 가능하다. 
		if(!/^[a-z][a-z0-9_]{4,9}$/i.test(f.userId.value)){
			alert("아이디는 5~10자 이내의 영문자, 숫자만 가능합니다.");
			f.userId.focus();
			return;
		}
	
		if(!/^(?=.*[a-z])(?=.*[!@#$%^&*+\-)]|.*[0-9]).{5,10}$/i.test(f.userPwd.value)){
			alert("패스워드는 5~10자 이내이며, 영문자와 숫자 또는 특수문자가 포함되어 있어야 합니다.");
			f.userPwd.focus();
			return;
		}

		if(f.userPwd.value!=f.userPwd1.value){
			alert("패스워드가 일치하지 않습니다.");
			f.userPwd.focus();
			return;
		}
	
		//quiz. 이름은 한글만 2~5자
		if(!/^[가-힣]{2,5}$/.test(f.userName.value)){
			alert("이름은 한글로만 2~5자로 입력하세요.");
			return;
		}
		//quiz. 생년월일은 날짜 검증
		if(!/^[12][0-9]{3}[\.\-\/][0-9]{2}[\.\-\/][0-9]{2}$/.test(f.birth.value)){
			alert("생년월일을 올바르게 입력하세요");
			return;
		}
		
		const birth = f.birth.value.replace(/[\.\-\/]/g,"");
		const y = parseInt(birth.substring(0,4));
		const m = parseInt(birth.substring(4,6));
		const d = parseInt(birth.substring(6));
		
		const lastDay = (new Date(y,m-1,d)).getDate();
		if(m<1||m>12){
			alert("월은 1~12월까지만입력하세요.");
			return;
		}
		if(d<1||d>lastDay){
			alert("일을 올바르게 입력하세요...");
			return;
		}
		
		//이메일 검증?
		if(f.email1.value.length==0 || f.email2.value.length==0){
			alert("이메일을 올바르게 입력하세요");
			return;
		}
		
		//quiz. 전화번호는 내용 입력하도록 검사 (앞자리는 3~4자리, 뒷자리는 4자리로 고정)
		if(f.tel1.value==""){
			alert("전화번호를 올바르게 선택하세요");
			return;
		}
		
		if(!/^[0-9]{3,4}$/.test(f.tel2.value)){
			alert("전화번호 앞자리는 3~4자리로 입력하세요.");
			return;
		}
		
		if(!/^[0-9]{4}$/.test(f.tel3.value)){
			alert("전화번호 뒷자리는 4자리로 입력하세요.");
			return;
		}
		
		//우편번호, 주소, 직업은 검증X
	
		//quiz  plus. 다음 우편번호 창 연동하기
		//alert("성공");
		
		//ok로 받기
		f.submit();
	}
	
	function changeEmail(){
		var f = document.memberForm;
		
		var s = f.selectEmail.value;
		if(s != "direct"){
			f.email2.value = s;
			f.email2.readOnly = true;
			f.email1.focus();
		} else{
			f.email2.value = "";
			f.email2.readOnly = false;
			f.email1.focus();
		}
	}
</script>
</head>
<body>

<div class="member">
	<div class="title">
	   <h3><span>|</span> 회원 가입</h3>
	</div>
	
	<div class="member-body">
		<form name="memberForm" method="post" action="member_ok.jsp">
			<table>
			<tr class="list-row-2">
				<td width="100" align="center" bgcolor="#E6E6E6">아&nbsp;이&nbsp;디</td>
				<td style="padding-left: 5px;">
					<input type="text" name="userId" id="userId"  maxlength="10"  class="boxTF">
				    <span id="userIdState" style='display:none;'></span>
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">패스워드</td>
				<td style="padding-left: 5px;">
					<input type="password" name="userPwd" class="boxTF" maxlength="10">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">패스워드 확인</td>
				<td style="padding-left: 5px;">
					<input type="password" name="userPwd1" class="boxTF" maxlength="10">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td style="padding-left: 5px;">
					<input type="text" name="userName" maxlength="20"  class="boxTF">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">생년월일</td>
				<td style="padding-left: 5px;">
					<input type="text" name="birth" maxlength="20"  class="boxTF">
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">이 메 일</td>
				<td style="padding-left: 5px;">
						  <select name="selectEmail" class="selectField" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com">네이버 메일</option>
								<option value="hanmail.net">한 메일</option>
								<option value="hotmail.com">핫 메일</option>
								<option value="gmail.com">지 메일</option>
								<option value="direct">직접입력</option>
						  </select>
						  <input type="text" name="email1" maxlength="30"  class="boxTF"> @ 
						  <input type="text" name="email2" maxlength="30"  class="boxTF" readonly="readonly">
				</td>
			</tr>
			
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">전화번호</td>
				<td style="padding-left: 5px;">
						  <select name="tel1" class="selectField">
								<option value="">선 택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						  </select>
						  <input type="text" name="tel2" maxlength="4"  class="boxTF"> -
						  <input type="text" name="tel3" maxlength="4"  class="boxTF" >
				</td>
			</tr>
		
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">우편번호</td>
				<td style="padding-left: 5px;">
					<input type="text" name="zip" size="25" maxlength="7"  class="boxTF" readonly="readonly">
					<button type="button" class="btn">우편번호검색</button>
				</td>
			</tr>
			
			<tr class="list-row-1" style="height: 70px;">
				<td width="100" align="center" bgcolor="#E6E6E6" valign="top" style="padding-top: 10px;">
				주&nbsp;&nbsp;&nbsp;&nbsp;소
				</td>
				<td style="padding-left: 5px;">
					<label style="display: block; margin-top: 5px;">
						<input type="text" name="addr1" maxlength="50"  class="boxTF"  readonly="readonly" style="width: 96%;">
					</label>
					<label style="display: block; margin-top: 5px; margin-bottom: 5px;">
						<input type="text" name="addr2" maxlength="50"  class="boxTF" style="width: 96%;">
					</label>
				</td>
			</tr>
			
			<tr class="list-row-1">
				<td width="100" align="center" bgcolor="#E6E6E6">직&nbsp;&nbsp;&nbsp;&nbsp;업</td>
				<td style="padding-left: 5px;">
					<input type="text" name="job" maxlength="7" class="boxTF">
				</td>
			</tr>
		
			<tr class="list-row-2" style="height: 50px;">
				<td align="center" colspan="2">
				    <button type="button" class="btn" onclick="sendOk();"> 회원가입 </button>
				    <button type="reset" class="btn"> 다시입력 </button>
				    <button type="button" class="btn"> 가입취소 </button>
				</td>
			</tr>
			
			<tr height="40">
				<td align="center" colspan="2">
					<span style="color: blue;"></span>
				</td>
			</tr>
			</table>
		</form>
	</div>
	
</div>	

</body>
</html>