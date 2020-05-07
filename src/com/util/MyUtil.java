package com.util;

public class MyUtil {
	/**
	 * ������ �� ���ϱ�
	 * 
	 * @param rows      �� ȭ�鿡 ǥ���� ������ ����
	 * @param dataCount ��ü ������ ��
	 * @return ������ ��
	 */
	public int pageCount(int rows, int dataCount) {
		if (dataCount <= 0) {
			return 0;
		}
		return dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
	}

	/**
	 * ����¡ó��(GET ���)
	 * 
	 * @param current_page ���� ǥ���� ������
	 * @param total_page   ��ü ������ ��
	 * @param list_url     ��ũ�� ������ url
	 * @return ����¡ ó�� ���
	 */
	public String paging(int current_page, int total_page, String list_url) {
		StringBuilder sb = new StringBuilder();

		int numPerBlock = 10; // ����¡ ���� ���� (10�������� ����)
		int currentPageSetup;// ǥ���� ù ������ - 1
		int n, page;

		if (current_page < 1 || total_page < 1) {
			return "";
		}

		if (list_url.indexOf("?") != -1) {
			list_url += "&";
		} else {
			list_url += "?";
		}

		// ex: 47/10*10 = 4*10 = 40
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		// ex: 50/10*10 = 5*10 = 50 => (����������) 50 - 10 = 40
		if (current_page % numPerBlock == 0) {
			currentPageSetup -= numPerBlock;
		}

		sb.append("<div id='paginate'>");
		// [ó��], [����](10������ ��)
		n = current_page - numPerBlock;// 10������ ������ �̵��ϱ� ���� ����
		if (total_page > n && currentPageSetup > 0) {// ��currentPageSetup
			sb.append("<a href='" + list_url + "page=1'>[ó��]</a>");
			sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'>[����]</a>");
		}

		// ����¡ ó�� (a�±�)
		page = currentPageSetup + 1;
		// 97���������� ������ ��� page�� 98�������� �Ǿ�� �� �ȴ�.
		while (page <= total_page && page <= (currentPageSetup + numPerBlock)) {
			//����#1. page <= total_page
			//������ ���ڶ��� ��� 97���������� �����ϴµ� 91�������� ������ 91~100�� �ƴ϶� 91~97������ ǥ�õǾ�� �Ѵ�.
			//����#2. 
			//�ٸ�, ������ ���ڶ��� �ƴ� ��쿡�� ���� ������ ������� �ʰ� numPerBlock ������ ǥ���ϸ� �ȴ�.
			if (page == current_page) {// ���� �������� ��� ����ǥ�ø� �ϰ� a�±׸� ���� �ʰ��� ��.
				sb.append("&nbsp;<span style='color:Fuchsia;'>" + page + "</span>");
			} else {
				sb.append("&nbsp;<a href='" + list_url + "page=" + page + "'>" + page + "</a>");
			}
			page++;
		}

		// [����][��]�� ������ ������ ���� �ƴϴ� (97���������� �����ϴ� ��� 91~97�������� ������ ����)
		n = current_page + numPerBlock;// 10������ �ڷ� �̵��ϱ� ���� ����
		if (n > total_page)
			n = total_page;

		// 87-80>10
		if (total_page - currentPageSetup > numPerBlock) {
			sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'>[����]</a>");
			sb.append("&nbsp;<a href='" + list_url + "page=" + total_page + "'>[��]</a>");
		}

		sb.append("</div>");

		return sb.toString();
	}

}
