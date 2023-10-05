package common;

public class BoardPage {
	public static String paginStr(int posts_page, int block_count, int pageNum, int toatalpage) {
		String paginStr = "";

		// pageTemp 의 결과는 1 11 21 31 밖에못옴 block_count 10개 소수점을 int로 바꿔버려서
		// 0.8.0.9도 모두 0으로 리턴됌
		int pageTemp = (((pageNum - 1) / block_count) * block_count) + 1;

		paginStr += "<a href='boardmain.jsp?pageNum=1'>[처음으로]</a>";
		paginStr += "&nbsp;";
		paginStr += "<a href='boardmain.jsp?pageNum=" + (pageNum - 1) + "'>[이전]</a>";

		int blockCount = 1;

		while (blockCount <= block_count && pageTemp <= toatalpage) {
			if (pageTemp == pageNum) {
				paginStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				paginStr += "&nbsp;<a href='boardmain.jsp?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}

		paginStr += "<a href='boardmain.jsp?pageNum=" + (pageNum + 1) + "'>[다음]</a>";
		paginStr += "&nbsp;";
		paginStr += "<a href='boardmain.jsp?pageNum=" + toatalpage + "'>[마지막으로]</a>";

		return paginStr;
	}
}
