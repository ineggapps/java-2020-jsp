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
	<h1>EL</h1>
	<p>Java를 쉽게 사용할 수 있게 만든 태그개념</p>
	<p>${3+5} => 8</p>
	<p>${"3"+5} => 8 ("35"가 나오지 않는다)</p>
	<hr />
	<p>3 + null = ${3+null }</p>
	<p>$&nbsp;{"A"+5 } => 오류</p>
	<p>10/5 = ${10/5} ▶ 나눗셈 연산은 자동으로 double형으로 바꾸어 계산해 준다.</p>
	<p>3/2 = ${3/2 }</p>
	<p>2/3 = ${2/3 }</p>
	<p>3>2 => ${3>2?"true":'false' }</p>
	<p>empty ""? => ${empty "" ? "없음":"있음" }</p>
	<p>empty null ? => ${empty null ? 'null임':'null 아님' }</p>
	<p>3==3 ? => ${3==3 ? "같다" : "같지 않다" }</p>
	<p>3 eq 3 ? => ${3 eq 3 ? "같다":"같지 않다" }</p> 
	<hr />
	<h2>EL 2.3버전부터 문자열 결합</h2>
	<p>EL의 목적은 출력이다. $&nbsp;{3}과 &lt;%=3 %&gt;는 같은 의미</p>
	<p>"서울" += "부산" => ${"서울" += "부산" }</p>
	<p>${1+2; 2+3 } => 2+3에 관한 결괏값만 출력됨</p> 
	<p>${a=10}, ${a} <= 변수에 저장하여 다시 출력하는 것도 가능하다</p>
	<p>${a=10; a } => 10</p>
	<p>${n=["a", "b", "c"] } => 배열 값들 출력</p> 
	<p>${m=["x", "y", "z"]; ""} => 배열 값들 선언만 하고 출력하고 싶지 않을 때</p>
	<p>${m[1] } => m[1] 출력</p>
</body>
</html>