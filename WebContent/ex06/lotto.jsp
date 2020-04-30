<%@ page contentType="text/html; charset=UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<%
	int rows = 5;
	int cols = 9;
	int num = 1;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=" />
    <style type="text/css">
    	#wrap{
    		width:700px;
    		margin: 50px auto;
    	}
    	#wrap table{
    		width:100%;
    		margin:20px auto;
    		border-collapse: collapse;
    		border-spacing: 0;
    	}
    	
    	#wrap table.title tr{
    		border-bottom:1px solid #d9d9d9;
    	}
    	
    	#wrap table.title tr td{
    	    padding:15px 0;
    	}
    
    	#wrap table.title tr.title {
    		font-weight:bold;
    		text-align:center;
    	}
    	
    	table.content td{
    		text-align:right;
    		padding:10px 0;
    	}
    	
    	table td.center{
    		text-align:center;
    	}
    	
    	button{
    		background-color:#fff;
    		border:1px solid #d9d9d9;
    		min-height:25px;
    		cursor:pointer;
    	}
    </style>
    <script>
    	function buy(){
    		var f = document.lottoForm;
    		var amount = f.amount.value;
    		var nums = f.nums;
    		//수량 입력 검사
    		if(!amount || !/^[0-9]$/.test(amount)){
    			alert("수량을 올바르게 입력하세요...");
    			f.amount.focus();
    			return;
    		}
    		
    		if(	amount<1 || amount>5){
    			alert("수량은 1~5개까지만 가능합니다.");
    			f.amount.focus();
    			return;
    		}
    		
    		//체크는 6개까지만...
    		var cnt = 0;
    		for(var i = 0;i<nums.length;i++){    			
	    		if(nums[i].checked){
	    			cnt++;
	    		}
    		}
    
    		if(cnt > 6){
    			alert("6개까지만 선택하세요...");
    			return;
    		}
    		f.submit();
    	}
    </script>
  </head>
  <body>
    <div id="wrap">
      <form action="lotto_ok.jsp" method="POST" name="lottoForm">
      <table class="title">
        <tr class="title">
          <td>꿈의 로또</td>
        </tr>
        <tr>
          <td>로또 구매 개수[1~5]: <input type="text" name="amount" maxlength="1" size="1"/></td>
        </tr>
      </table>
      <table class="content">
        <tr>
          <td colspan="9" class="center">포함할 수[최대 6개까지 추가 가능]</td>
        </tr>
        <tr>
        	<%
        		for (int i=0;i<rows;i++){
        			for(int j=0;j<cols;j++){%>
	          <td><%=num %>&nbsp;<input type="checkbox" name="nums" value="<%=num++ %>" /></td>
        	<% 	}
        			out.print("</tr>");
        			if(i==rows-1){
        				out.print("<tr>");
        			}
        		}
        	%>
        </tr>
      </table>
      <table class="control">
      	<tr>
      		<td><button type="button" onclick="buy();">구매하기</button></td>
      	</tr>
      </table>
      </form>
    </div>
  </body>
</html>
