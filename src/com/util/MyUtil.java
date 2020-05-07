package com.util;

public class MyUtil {
	/**
	 * 페이지 수 구하기
	 * 
	 * @param rows      한 화면에 표시할 데이터 개수
	 * @param dataCount 전체 데이터 수
	 * @return 페이지 수
	 */
	public int pageCount(int rows, int dataCount) {
		if (dataCount <= 0) {
			return 0;
		}
		return dataCount / rows + (dataCount % rows > 0 ? 1 : 0);
	}

	/**
	 * 페이징처리(GET 방식)
	 * 
	 * @param current_page 현재 표시할 페이지
	 * @param total_page   전체 페이지 수
	 * @param list_url     링크를 설정할 url
	 * @return 페이징 처리 결과
	 */
	public String paging(int current_page, int total_page, String list_url) {
		StringBuilder sb = new StringBuilder();

		int numPerBlock = 10; // 페이징 단위 개수 (10페이지씩 나열)
		int currentPageSetup;// 표시할 첫 페이지 - 1
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
		// ex: 50/10*10 = 5*10 = 50 => (나머지연산) 50 - 10 = 40
		if (current_page % numPerBlock == 0) {
			currentPageSetup -= numPerBlock;
		}

		sb.append("<div id='paginate'>");
		// [처음], [이전](10페이지 전)
		n = current_page - numPerBlock;// 10페이지 앞으로 이동하기 위한 연산
		if (total_page > n && currentPageSetup > 0) {// ★currentPageSetup
			sb.append("<a href='" + list_url + "page=1'>[처음]</a>");
			sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'>[이전]</a>");
		}

		// 페이징 처리 (a태그)
		page = currentPageSetup + 1;
		// 97페이지까지 존재할 경우 page는 98페이지가 되어서는 안 된다.
		while (page <= total_page && page <= (currentPageSetup + numPerBlock)) {
			//조건#1. page <= total_page
			//페이지 끝자락의 경우 97페이지까지 존재하는데 91페이지에 있으면 91~100이 아니라 91~97까지만 표시되어야 한다.
			//조건#2. 
			//다만, 페이지 끝자락이 아닌 경우에는 위의 사항을 고려하지 않고 numPerBlock 단위로 표시하면 된다.
			if (page == current_page) {// 현재 페이지의 경우 강조표시를 하고 a태그를 쓰지 않고자 함.
				sb.append("&nbsp;<span style='color:Fuchsia;'>" + page + "</span>");
			} else {
				sb.append("&nbsp;<a href='" + list_url + "page=" + page + "'>" + page + "</a>");
			}
			page++;
		}

		// [다음][끝]도 무조건 나오는 것이 아니다 (97페이지까지 존재하는 경우 91~97페이지는 보이지 않음)
		n = current_page + numPerBlock;// 10페이지 뒤로 이동하기 위한 연산
		if (n > total_page)
			n = total_page;

		// 87-80>10
		if (total_page - currentPageSetup > numPerBlock) {
			sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'>[다음]</a>");
			sb.append("&nbsp;<a href='" + list_url + "page=" + total_page + "'>[끝]</a>");
		}

		sb.append("</div>");

		return sb.toString();
	}

}
