package com.util;

public class MyUtilPractice {
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
	
	public String paging(int current_page, int total_page, String list_url) {
		
	}
}
