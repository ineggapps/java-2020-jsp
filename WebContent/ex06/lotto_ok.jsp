<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	//로또 기본설정
	List<Integer> lotto;
	List<List<Integer>> cases = new ArrayList<List<Integer>>();
	request.setCharacterEncoding("utf-8");
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	String[] nums = request.getParameterValues("nums");
	Integer[] numbers = new Integer[nums.length];
	for(int i=0;i<nums.length;i++){
		numbers[i] = Integer.parseInt(nums[i]);
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
</head>
<body>
	<table>
	<tr><td>당첨번호</td></tr>
	<%
		for(List<Integer> lt: cases){
			out.print("<tr><td>");
			for(Integer n: lt){
				out.print("<span>");
				out.print(n+ "</span>&nbsp;");
			}
			out.print("</td></tr>");
		}
	%>
	</table>
</body>
</html>