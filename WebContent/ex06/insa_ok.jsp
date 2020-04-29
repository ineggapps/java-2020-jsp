<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.KOREA);
	
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String band[] = { "원숭이", "닭", "개", "돼지", "쥐", "소", "범", "토끼", "용", "뱀", "말", "양" };
	int year = Integer.parseInt(birth.substring(0,4));
	int month = Integer.parseInt(birth.substring(5,7));
	int date = Integer.parseInt(birth.substring(8));	
	int yearsOld = 999;
	String myBand = band[year % band.length];
	String phone = request.getParameter("phone");
	String salary = request.getParameter("salary");
	int sal = 0;
	if (!salary.equals("") && salary != null) {
		sal = Integer.parseInt(salary);
	}
	String bonus = request.getParameter("bonus");
	int bon = 0;
	if (!bonus.equals("") && bonus != null) {
		bon = Integer.parseInt(bonus);
	}
	double tax = 0;
	if(sal+bon >= 3000000){
		tax = (sal+bon)*0.03;
	} else if (sal+bon >= 2000000){
		tax = (sal+bon)*0.02;
	}
	int income = (int)(sal+bon - tax);
	salary = nf.format(sal);
	bonus = nf.format(bon);
	String taxS = nf.format(tax);
	String incomeS = nf.format(income);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
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
</head>
<body>
	<div id="wrap">
		<table>
			<tr>
				<td>이름</td>
				<td><%=name%></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=birth%></td>
			</tr>
			<tr>
				<td>띠</td>
				<td><%=myBand %>띠</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=yearsOld %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=phone%></td>
			</tr>

			<tr>
				<td>기본급</td>
				<td><%=salary%></td>
			</tr>
			<tr>
				<td>수당</td>
				<td><%=bonus%></td>
			</tr>
			<tr>
				<td>세금</td>
				<td><%=taxS%></td>
			</tr>
			<tr>
				<td>실급여</td>
				<td><%=incomeS%></td>
			</tr>

		</table>
	</div>
</body>
</html>