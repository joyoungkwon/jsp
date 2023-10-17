package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class LoginCheck extends HttpServlet {
       
   
	MemberDAO dao ;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		 dao = new MemberDAO();
		
	}
	@Override
	public void destroy() {
		dao.close();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDTO dto = dao.getMemberDTO(id, password);
		
		String userName = dto.getName();
		
		
		if(userName!=null) {
			request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		}else {
			request.getRequestDispatcher("login.jsp?error=2").forward(request, response);
		}
	}

}
