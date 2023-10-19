package model2.mvcBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;




@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		
		//list에서 넘김 <a>링크로
			String ofile = request.getParameter("ofile");
			String sfile = request.getParameter("sfile");
			String idx = request.getParameter("idx");
			
			FileUtil.download(request, response, "/Uploads", sfile, ofile);
			
			MVCBoardDAO dao = new MVCBoardDAO();
			
			dao.downCountPlus(idx);
			
			dao.close();
		
		
	}
	
	
	
		
	
	
}
