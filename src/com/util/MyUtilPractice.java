package com.util;

public class MyUtilPractice {
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
	
	public String paging(int current_page, int total_page, String list_url) {
		
	}
}
