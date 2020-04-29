<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<form action="ex1_ok.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>패스워드: <input type="password" name="password"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>성별: <input type="radio" name="gender" value="남" checked="checked"> 남자
					  <input type="radio" name="gender" value="여"> 여자
		</p>
		<p>학력:
			<select name="hak">
				<!-- value 속성이 없으면 option 사이에 들어간 값이 전달된다.  -->
				<option value="">::선택::</option>
				<option value="대졸" selected="selected">대졸</option>
				<option value="고졸">고졸</option>
				<option value="기타">기타</option>
			</select>
		</p>
		<p>
			<input type="checkbox" name="hobby" value="운동"> 운동!
			<input type="checkbox" name="hobby" value="게임"> 게임@
			<input type="checkbox" name="hobby" value="영화"> 영화#
			<input type="checkbox" name="hobby" value="독서"> 독서$
			<input type="checkbox" name="hobby" value="음악"> 음악감상%
			<input type="checkbox" name="hobby" value="여행"> 여행^
		</p>
		<p>
			좋아하는 과목: 
			<select name="subject" multiple="multiple" size="5">
				<option value="java">자바</option>
				<option value="spring">스프링</option>
				<option value="oracle">오라클</option>
				<option value="html">HTML</option>
				<option value="css">CSS</option>
			</select>
		</p>
		<p>
			메모:
			<textarea rows="5" cols="60" name="memo" placeholder="메모"></textarea>
		</p>
		<p>
			<button type="submit">보내기</button>
			<button type="reset">다시 입력</button>
		</p>
	</form>
</body>
</html>