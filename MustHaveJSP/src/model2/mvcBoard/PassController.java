package model2.mvcBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFuncton;




public class PassController extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		request.setAttribute("mode", request.getParameter("mode"));
		request.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String idx = request.getParameter("idx");
		String mode = request.getParameter("mode");
		String pass = request.getParameter("pass");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		
		boolean confirmed = dao.confirmPassword(pass, idx);
		
		System.out.println(confirmed);
		
		
		if(confirmed) {
			if(mode.equals("edit")) {
				HttpSession session = request.getSession();
				session.setAttribute("pass", pass);
				response.sendRedirect("../mvcboard/edit.do?idx="+idx);
				
			}else if(mode.equals("delete")){
				dao = new MVCBoardDAO();
				MVCBoardDTO dto = dao.selectView(idx);
				int result = dao.deletePost(idx);
				dao.close();
				if(result==1) {
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(request,"/Uploads", saveFileName);
				}
				JSFuncton.alertLocation(response, "삭제되었습니다", "../mvcboard/list.do");
			}
			
		}else {
			JSFuncton.alertBack(response, "비밀번호오류");
		}
		
	}
	
		
	
	
}
