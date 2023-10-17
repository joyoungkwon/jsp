package model2.mvcBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO(); //데이터베이스연결

		Map<String, Object> map = new HashMap<>();//맵세팅
		// request영역으로 설정하고 보내는값의 searchField,searchWord값받아오기
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		// searchField값은 항상있으므로 Word값이 있으면 맵으로 저장.
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//페이징기능 시작.
		int totalCount = dao.selectCount(map);

		ServletContext application = getServletContext();

		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));

		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");

		if (pageTemp != null && !pageTemp.equals(" ")) {
			pageNum = Integer.parseInt(pageTemp);
		}

		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;

		map.put("start", start);
		map.put("end", end);

		List<MVCBoardDTO> boardList = dao.selectList(map);
		dao.close();
		
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		// 세션값으로 list타입을 설정하고 
		// 세션값으로 map값 전체를 설정해버림
		request.setAttribute("boardList", boardList);
		request.setAttribute("map", map);
		
		// 불러서쓰기위해서 써버리기
		request.getRequestDispatcher("/14MVCBoard/List.jsp").forward(request, response);

	}

}
