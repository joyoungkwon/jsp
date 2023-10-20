package mem;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.MemberShipDAO;
import DB.MemberShipDTO;

public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		MemberShipDAO dao = new MemberShipDAO();
		
		MemberShipDTO dto = dao.selectlist(id, pw);
		
		
		HttpSession session = request.getSession();
		
		if(dto.getId() != null) {
			
			session.setAttribute("dto", dto);
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/Member/login.jsp?error=1").forward(request, response);
		}
	}

}
