package model2.mvcBoard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFuncton;

public class WriteController extends HttpServlet {
	
	 JspWriter out ;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(request, response);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		ServletContext application = getServletContext();
		
		
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		if(mr==null) {
			JSFuncton.alertLocation(response, "파일용량을 벗어남", "../mvcboard/write.do");
			return;
		}
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		
		String fileName = mr.getFilesystemName("ofile");
		if(fileName!=null) { // 파일 선택값이 있으면
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String now = new  SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String newFileName = now + ext;
			
			File oldFile = new File(saveDirectory,File.separator+fileName);
			File newFile = new File(saveDirectory, File.separator+newFileName);
			
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
		}
		MVCBoardDAO dao = new MVCBoardDAO();
		
		int result = dao.insertWrite(dto);
		
		if(result ==1) {
			response.sendRedirect("../mvcboard/list.do");
		}else {
			response.sendRedirect("../mvcboard/write.do");
		}
		
		
		
	}
	
}
