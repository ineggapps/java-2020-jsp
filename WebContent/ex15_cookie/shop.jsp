<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
</head>
<body>

	<h2>상품 목록</h2>
	<table>
		<thead>
			<tr>
				<th>제품명</th>
				<th>제조사</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="shop_detail_1.jsp">냉장고</a></td>
				<td><a href="shop_detail_1.jsp">삼싱</a></td>
				<td><a href="shop_detail_1.jsp">200</a></td>
			</tr>
			<tr>
				<td><a href="shop_detail_2.jsp">컴퓨터</a></td>
				<td><a href="shop_detail_2.jsp">삼싱</a></td>
				<td><a href="shop_detail_2.jsp">150</a></td>
			</tr>
			<tr>
				<td><a href="shop_detail_3.jsp">노트북</a></td>
				<td><a href="shop_detail_3.jsp">엘디</a></td>
				<td><a href="shop_detail_3.jsp">140</a></td>
			</tr>
			<tr>
				<td><a href="shop_detail_4.jsp">핸드폰</a></td>
				<td><a href="shop_detail_4.jsp">엘디</a></td>
				<td><a href="shop_detail_4.jsp">70</a></td>
			</tr>
		</tbody>
	</table>
	 
	<h2>오늘 본상품 목록</h2>
	<p><a href="shop_clear_cookie.jsp">목록 지우기</a></p>
	<ul>
		<%
			Cookie[] cc = request.getCookies();
			for(Cookie c: cc){
				if(c.getName().startsWith("product")){
					String value = URLDecoder.decode(c.getValue(), "utf-8");
					out.println("<li>" + value +"</li>");
				}
			}
		%>
	</ul>
	
</body>
</html>