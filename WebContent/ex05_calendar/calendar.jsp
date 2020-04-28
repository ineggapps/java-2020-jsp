<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
//파라미터가 넘어오는 것이 없으면 null을 받는다.
String sy = request.getParameter("year");
String sm = request.getParameter("month");

//null check
if (sy != null) {
	year = Integer.parseInt(sy);
}
if (sm != null) {
	month = Integer.parseInt(sm);
}

cal.set(year, month - 1, 1);//해당 연월일을 대입.
year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH) + 1;
int week = cal.get(Calendar.DAY_OF_WEEK);//1~7 (JAVA에서는 1~7까지임.)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;

* {
	margin: 0;
	padding: 0;
}

body {
	font-size: 18px;
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	color: inherit;
	text-decoration: none;
}

a:hover {
	color: tomato;
	text-decoration: underline;
}

#layout {
	margin: 30px auto;
	width: 210px;
}

#layout table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

#layout table tr {
	height: 30px;
	text-align: center;
}

.character {
	font-size: 2rem;
	text-align: center;
	margin:20px 0;
}

.calendar td {
	border: 1px solid #d9d9d9;
}

.head {
	background-color: #f0f0f0;
}

table{
	margin: 10px 0;
}
</style>
</head>
<body>
	<div id="layout">
		<p class="character"> ( ｯ◕ ܫ◕)ｯ' </p>
		<table>
			<tr>
				<td><a href="calendar.jsp?year=<%=year%>&month=<%=month - 1%>">◀</a>
					<%=year%>년 <%=month%>월 <a
					href="calendar.jsp?year=<%=year%>&month=<%=month + 1%>">▶</a></td>
			</tr>
		</table>
		<table class="calendar">
			<tr class="head">
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
			<%
				int col = 0;
			out.print("<tr>");
			//1일 앞 공백처리
			for (int i = 1; i < week; i++) {
				out.println("<td>&nbsp;</td>");
				col++;
			}
			//날짜 채우기 (7일 단위로)
			int lastDay = cal.getActualMaximum(Calendar.DATE);
			for (int i = 1; i <= lastDay; i++) {
				out.print("<td>" + i + "</td>");
				col++;
				if (col == 7 && i != lastDay) {
					out.print("</tr><tr>");
					col = 0;
				}
			}
			//말일 뒤 공백 처리하기
			while (col > 0 && col < 7) {
				out.print("<td>&nbsp;</td>");
				col++;
			}
			out.print("</tr>");
			%>
		</table>
	</div>
</body>
</html>
