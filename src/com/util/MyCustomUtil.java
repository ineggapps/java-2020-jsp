package com.util;

import java.util.ArrayList;
import java.util.List;

public class MyCustomUtil {
	public int pageCount(int rows, int dataCount) {
		//�������� ������ 0�� ��� ó�� ���
		if(dataCount<=0) {
			return 0;
		}
		//�� ������ ��  = dataCount / �� ��
		//�׷��� dataCount / �� ���� �������� �����ϸ� +1�� �� �ؾ� �Ѵ�.
		//ex:97���� �����Ͱ� ������ 97/10=9�� �ƴ϶� 9+1�� �� 10�� ���;� �Ѵٴ� ���̴�.
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
95���������� �ִٰ� ����
 1 2 3 4 5 6 7 8 9 10 
 [ó��] [����] 6 7 8 9 10 11 12 13 14 15 [����] [��]


 [ó��] [����] 91 92 93 94 95
*/