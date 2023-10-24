package mvc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import common.JSFunction;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	
		private static final long serialVersionUID =1L;
		static final int LISTCOUNT=5;
		JspWriter out;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식 메서드가 넘어와도 post로 넘기는 식.
		doPost(request, response);
		
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 웹파일에서 *.do 에서 확장자를 모두 *로 통일 시켜버림 끌어와서 짤라서 할꺼임
		String requestURI = request.getRequestURI();
		
		String contextPath = request.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) { //등록된 글 출력하기.
			requestBoard(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response); // 밑에나 아래나 getRequestDispatcher 똑같음.
			
		}else if(command.equals("/BoardWriteForm.do")) {
			request.getRequestDispatcher("./board/write.jsp").forward(request, response);
			
			
		}else if(command.equals("/BoardWriteAction.do")) {
			requestBoarWrite(request);
			request.getRequestDispatcher("/BoardListAction.do").forward(request, response);
			
		}else if(command.equals("/BoardViewAction.do")){
			requestBoardView(request);
			request.getRequestDispatcher("./board/view.jsp").forward(request, response);
			
		}else if(command.equals("/BoardUpdateAction.do")) {
			requestUpdate(request);
			request.getRequestDispatcher("/BoardListAction.do").forward(request, response);
			
		}else if(command.equals("/BoardDeleteAction.do")) {
			requestDelete(request);
			request.getRequestDispatcher("/BoardListAction.do").forward(request, response);
			
		}
		
	}
	public void requestBoard(HttpServletRequest request) {
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		
		int pageNum=1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record = dao.getListCount(items, text);
		boardList = dao.getBoardList(pageNum, limit, items, text);
		dao.close();
		int total_page;// 전체페이지
		
		if(total_record % limit ==0) {
			//전체 게시물개수에서 한 페이지당 표시할 개수를 나눈 나머지가0과같으면
			// 페이지당 10개씩 게시물을 표시함 전체게시물이100개
			// 100/10 -> 나머지 0 전체 페이지수는 10으로 표시함
			total_page = total_record/limit;
			Math.floor(total_page);
		}else {
			// 한페이지당 10개씩표시 전체 게시물이 105개면
			//전체페이지수 는 10개에더하기 1을추가하여 11페이지가 나와야함
			total_page = total_record/limit;
			Math.floor(total_page);
			total_page = total_page+1;
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardList);
		
	}
	
	public void requestBoarWrite(HttpServletRequest request) {
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		dto.setId(id);
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		
		
		SimpleDateFormat fomat = new SimpleDateFormat("yyyy-MM-dd");
		String today = fomat.format(new Date());
		
		dto.setRegist_day(today);
		dto.setHit(0);
		dto.setIp(request.getRemoteAddr());
		
		/*
		 * for(int i = 1 ; i<=100; i++) { dto.setSubject(subject + i);
		 * dao.insertWrite(dto); }
		 */
		
		dao.insertWrite(dto);
		
		dao.close();
		
		
	}
	public void requestBoardView(HttpServletRequest request) {
		
		
		String num = request.getParameter("num");
//		int pageNum = (Integer.parseInt(request.getParameter("pageNum")));
		String pageNum = request.getParameter("pageNum");
		
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto = dao.selectView(num);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
	
		dao.close();
		
	}
	public void requestUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		dto.setNum(num);
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		dao.Editboard(dto);
		dao.close();
		
		
	}
	
	
	public void requestDelete(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setNum(num);
		
		dao.deletboard(dto);
		
		dao.close();
		
	}
	
	
}
