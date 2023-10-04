package utils;

public class BoardPage {
	
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
			String pagingStr="";
			
			int totalpages = (int)(Math.ceil(((double)totalCount/pageSize))); // 전체 페이지수
			
			
			//1~5페이질때 pageTmep는 1
			//6~10페이지일때 pageTemp는 6
			// 11~15페이지 일때 pageTemp는 11
			// 첫페이지와 이전블록을 설정하기
			int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
			if(pageTemp!=1) {
				pagingStr +="<a href='"+reqUrl+ "?pageNum=1'>[첫 페이지]</a>";
				pagingStr +="&nbsp;";
				pagingStr += "<a href='" + reqUrl + "?pageNum=" +(pageTemp-1)+"'>[이전블럭]</a>";
			}
			// 하단 중앙에 각 페이지번호를 다섯개씩 출력
			int blockCount =1;
			while(blockCount <= blockPage && pageTemp <= totalpages) {
				if(pageTemp == pageNum) {
					pagingStr += "&nbsp;" + pageTemp +"&nbsp;";
				}else {
					pagingStr += "&nbsp;<a href='"+ reqUrl +"?pageNum=" + pageTemp + "'>"+
							pageTemp + "</a>&nbsp;";
				}
				pageTemp++;
				blockCount++;
			}
			// 다음 블럭과 마지막 페이지를 출력
			if(pageTemp <= totalpages) {
				pagingStr +="<a href='"+reqUrl+ "?pageNum=" + pageTemp + "'>[다음 페이지]</a>";
				pagingStr +="&nbsp;";
				pagingStr += "<a href='" + reqUrl + "?pageNum=" +totalpages+"'>[마지막 페이지]</a>";
				
			}
			
			return pagingStr;
	}

}
