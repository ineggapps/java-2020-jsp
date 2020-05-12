<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>
	<div>
		<c:if test="${empty sessionScope.id}">
		<form action="login_ok.jsp" method="post">
			<p>
				아이디: <input type="text" name="id" value="test" />
			</p>
			<p>
				비밀번호: <input type="password" name="pwd" value="test" />
			</p>
			<p>${msg}</p>
			<p>
				<button type="submit">로그인</button>
			</p>
		</form>
		</c:if>
	</div>
	<div>
		<c:if test="${not empty sessionScope.id}">
		<p>${sessionScope.name} 님 안녕하세요? 	<a href="logout.jsp">로그아웃</a></p>
		</c:if>
	</div>
	<div>
		<p><a href="sessionSet.jsp">세션정보 설정</a></p>
		<p><a href="sessionInfo.jsp">세션정보 확인</a></p>
		<p><a href="removeInfo.jsp">세션정보 삭제</a></p>
	</div>
</body>
</html>