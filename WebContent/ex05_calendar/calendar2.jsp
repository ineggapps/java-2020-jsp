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
	margin: 20px 0;
}

.calendar td {
	width: 30px;
	color: #333;
	border: 1px solid #d9d9d9;
}

.calendar td:nth-child(7n+1) {
	color: tomato;
}

.calendar td:nth-child(7n) {
	color: blue;
}

.calendar td.gray {
	color: #d9d9d9;
}

.head {
	background-color: #f0f0f0;
}

table {
	margin: 10px 0;
}
</style>
<script>
	function change() {
		var f = document.calendarForm;
		//alert(f.year.value + ":" + f.month.value);
		f.action ="calendar2.jsp";
		//form의 action속성을 지정하지 않으면 자기 자신을 가리킨다. 원칙은 action을 지정해 주는 것이다.
		//javascript에서는 위와 같이 action 속성을 지정하면 된다.
		f.submit();
	}
</script>
</head>
<body>
	<div id="layout">
		<p class="character"> ༼'๑◕⊖◕๑༽ </p>
		<form name="calendarForm" method="post">
			<table>
				<tr>
					<td><select name="year" onchange="change();">
							<%
								for (int i= year-5; i <= year+5; i++) {
							%>
							<option value="<%=i%>"
								<%=year == i ? "selected=\"selected\"" : ""%>><%=i%>년
							</option>
							<%
								}
							%>
					</select> <select name="month" onchange="change();">
							<%
								for (int i = 1; i <= 12; i++) {
							%>
							<option value="<%=i%>"
								<%=month == i ? "selected=\"selected\"" : ""%>><%=i%>월
							</option>
							<%
								}
							%>
					</select></td>
				</tr>
			</table>
		</form>
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
			Calendar preCal = (Calendar) cal.clone();
			preCal.set(Calendar.DATE, -(week - 1 - 1));
			int preDate = preCal.get(Calendar.DATE);
			//1일 앞 처리
			for (int i = 1; i < week; i++) {
				out.println("<td class='gray'>" + (preDate++) + "</td>");
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
			//마지막 주 말일 다음 일 처리하기
			int n = 1;
			while (col > 0 && col < 7) {
				out.print("<td class='gray'>" + (n++) + "</td>");
				col++;
			}
			out.print("</tr>");
			%>
		</table>
	</div>
</body>
</html>
