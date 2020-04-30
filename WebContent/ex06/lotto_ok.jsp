<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
	public boolean isSelected(Integer num, Integer numbers[]){
		for(int n: numbers){
			if(n==num){
				return true;
			}
		}
		return false;
	}
%>
<%
	//로또 기본설정
	List<Integer> lotto;
	List<List<Integer>> cases = new ArrayList<List<Integer>>();
	request.setCharacterEncoding("utf-8");
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	String[] nums = request.getParameterValues("nums");
	Integer[] numbers;
	if(nums!=null && nums.length>0){
		//null check 및 길이 체크
		numbers = new Integer[nums.length];
		for(int i=0;i<nums.length;i++){
			numbers[i] = Integer.parseInt(nums[i]);
		}
	}else{
		numbers = new Integer[0];
	}
	
	//수량만큼 배열 만들어서 넣기
	for(int i=0;i<amount;i++){
		lotto = new ArrayList<Integer>();
		//기본으로 고르는 숫자...
		if(nums!=null){
			for(String n: nums){
				lotto.add(Integer.parseInt(n));
			}
		}
		//랜덤하게 만들기
		for(int j=lotto.size();j<6;j++){
			int num = (int)(Math.random()*45)+1;
			for(int k=0;k<lotto.size();k++){
				if(lotto.get(k)==num){
					lotto.remove(k);
					j--;
					break;
				}
			}
			lotto.add(num);
		}
		//정렬
		Collections.sort(lotto);
		//경우의 수 하나 삽입
		cases.add(lotto);
		//테스트 코드
		//out.println(Arrays.toString(lotto.toArray()));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=" />
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
	*{
		margin:0;
		padding:0;
	}
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#wrap{
		width:700px;
		margin:0 auto;
	}
	
	#wrap table{
		width:100%;
		margin:10px auto;
		border-collapse: collapse;
		border-spacing: 0;
	}
	
	#wrap table tr.title{
		border-bottom:1px solid #d9d9d9;	
	}
	
	#wrap table tr.title td{
		font-size:2rem;
	}
	
	#wrap table tr td{
		padding:10px 0;
		text-align:center;
		font-size:1.8rem;
	}
	
	#wrap table tr td span{
		text-align:center;
		display:inline-block;
		width:40px;
		height:40px;
		padding:20px;
		margin:10px 5px;
		background-color:#efefef;
		border-radius:100%;
	}
	
	#wrap table tr td span.selected{
		background-color:tomato;
		color:#fff;
		font-weight:bold; 
	}
</style>
</head>
<body>
	<div id="wrap">
		<table>
		<tr class="title"><td> ʘ̥_ʘ̥ 생성 번호</td></tr>
		<%
			for(List<Integer> lt: cases){
				out.print("<tr><td>");
				for(Integer n: lt){
					if(isSelected(n, numbers)){
						out.print("<span class=\"selected\">");
					}else{					
						out.print("<span>");
					}
					out.print(n+ "</span>");
				}
				out.print("</td></tr>");
			}
		%>
		</table>
	</div>
</body>
</html>