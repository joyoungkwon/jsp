package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.one")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		int lastSlash = uri.lastIndexOf("/");// 마지막슬레쉬 지정
		 
		String commandStr = uri.substring(lastSlash); // 마지막 슬레쉬 지정후 서브스트링으로 쪼개면
		// /을 포함한 뒷자리 uri를 뽑아와서 commandStr 의 저장시킴
		
		
		if(commandStr.equals("/regist.one")) { // 뽑아온값 가지고 commandStr  값 비교하기
			registFunc(request);
		}else if(commandStr.equals("/login.one")){
			loginFunc(request);
		}else if(commandStr.equals("/freeboard.one")) {
			freeboardFunc(request);
		}
		
		request.setAttribute("uri", uri);
		request.setAttribute("commandStr", commandStr);
		
		request.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(request, response);
	}
	
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.service(req, resp);
	}

	

}
