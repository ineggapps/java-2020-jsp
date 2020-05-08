package com.util;

import java.util.ArrayList;
import java.util.List;

public class MyCustomUtil {
	public int pageCount(int rows, int dataCount) {
		//데이터의 개수가 0인 경우 처리 방법
		if(dataCount<=0) {
			return 0;
		}
		//총 페이지 수  = dataCount / 행 수
		//그런데 dataCount / 행 수의 나머지가 존재하면 +1을 더 해야 한다.
		//ex:97개의 데이터가 있으면 97/10=9가 아니라 9+1을 한 10이 나와야 한다는 것이다.
		return dataCount / rows + (dataCount%rows>0?1:0);
	}
	
	public int[] paging(int current_page, int total_page, String list_url) {
		
		int numPerBlock = 10;
		int start = current_page-4>0?current_page-4:1;
		int end;
		int page = start;
		List<Integer> pages = new ArrayList<>();
		
		if(start+numPerBlock<total_page) {
			end = start+numPerBlock-1; 
		}else {
			end = total_page;
		}
		
		
		if(list_url.indexOf("?")>=0) {
			list_url += "&";
		}else {
			list_url += "?";
		}
		
		while(page <= end) {
//		while(page <= total_page && page < start+numPerBlock) {
			pages.add(page++);
		}
		
		return pages.stream().mapToInt(i->i).toArray();
	}
}


/*
95페이지까지 있다고 가정
 1 2 3 4 5 6 7 8 9 10 
 [처음] [이전] 6 7 8 9 10 11 12 13 14 15 [다음] [끝]


 [처음] [이전] 91 92 93 94 95
*/