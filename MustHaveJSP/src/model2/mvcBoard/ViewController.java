package model2.mvcBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		MVCBoardDAO dao = new MVCBoardDAO();
		String idx = request.getParameter("idx");
		dao.updateVisitCount(idx); // 조회수 증가
		
		MVCBoardDTO dto = dao.selectView(idx);
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>")); // 문자열 제배치
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/14MVCBoard/View.jsp").forward(request, response);
		
		
	}
	
	
	
		
	
	
}
