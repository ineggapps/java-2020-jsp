<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<%
	int rows = 10;
	int cols = 15;
	int rowCount = 0;
	int colCount = 0;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
  </head>
  <body>
    <form method="POST">
      <table>
        <tr class="screen">
          <td colspan="18">스크린</td>
        </tr>
        <tr class="line">
        	<td>&nbsp;</td>
        	<% for(int i=1;i<=cols;i++){ %>
        		<td><%=i %></td>
        	<%} %>
        </tr>
        <tr class="seat">
        <%
        	for(int i=1;i<=rows;i++){
        		for(int j=1;j<=cols;j++){
        			if(j==1){%>
        				<td><%=i %></td>	
        <%		}
        %>		
        			<td><input type="checkbox" value="<%=i %>:<%=j%>"/></td>		
        <%
        		}
        		out.print("</tr>");
        		if(i<rows){
        			out.print("<tr>");
        		}
        	}
        %>
        </tr>
      </table>
    </form>
  </body>
</html>
