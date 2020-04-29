<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	int rows = 10;
	int cols = 15;
	
	int width = cols * 30 + 20 * (cols / 5) + 30;//통로까지 계산 (통로는 20px, 열 숫자칸 30px)
	if (cols / 5 == 0) {
		cols -= 20;
	}
	
	String[] cc = { "2:3", "2:4", "5:6", "8:2", "8:3" };
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
<script>
	function sendOk(){
		var f = document.forms[0];
		var cnt = 0;
		for(var i=0;i<f.chks.length;i++){
			//이미 서버에서 체크되어 넘어온 것은 무시하고 넘기기
			if(f.chks[i].disabled){
				continue;
			}
			//체크된 것 개수 세기
			if(f.chks[i].checked==true){
				cnt++;
			}
		}
		//4개 이상이나 1개 미만 선택하면...
		if(cnt<1 || cnt>4){
			alert("좌석은 1~4까지 예약 가능합니다.");
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
	<div style="margin:30px auto; width:<%=width%>px;">
		<table style="width:100%; border-spacing:0;">
			<tr height="30" align="center" bgcolor="#e4e4e4">
					<td>스크린</td>
			</tr>
		</table>
		<form action="reserveEx_ok.jsp" method="post">
			<table style="width:100%; margin-top:10px; border-spacing:0;">
				<tr height="30" align="center">
					<%
						out.print("<td width=\"30\">&nbsp;</td>");
						for(int i=1;i<=cols;i++){
							if(i!=1 && i%5==1){
								out.print("<td width=\"20\">&nbsp;</td>");
							}
								out.print("<td width=\"30\">"+i+"</td>");
						}
					%>
				</tr>
				<%
					String s;
					for(int i=1;i<=rows;i++){
						out.print("<tr height=\"25\" align=\"center\">");
						out.print("<td>" + i + "</td>");
						for(int j=1;j<=cols;j++){
							if(j!=1 && j%5==1){
								out.print("<td bgcolor=\"#e4e4e4\">&nbsp;</td>");
							}
							s = i + ":" + j;
							boolean b = false;
							for(int k=0;k<cc.length;k++){
								if(s.equals(cc[k])){
									b=true;
									break;
								}	
							}
							out.print("<td>");
							if(b){
								out.print("<input type=\"checkbox\" name=\"chks\" value=\""+s+"\" checked=\"checked\" disabled=\"disabled\" />");				
							}else{
								out.print("<input type=\"checkbox\" name=\"chks\" value=\""+s+"\" />");				
							}
							out.print(i+":"+j);
							out.print("</td>");
						}
						out.print("</tr>");
					}
				%>
			</table>
		</form>
		<table style="width:100%; margin-top:5px;">
			<tr height="35" align="right">
				<td>
					<button type="button" onclick="sendOk();">좌석 예약</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>