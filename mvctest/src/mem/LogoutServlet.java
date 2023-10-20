package mem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.MemberShipDTO;

public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		MemberShipDTO dto = (MemberShipDTO)session.getAttribute("dto");
		
		String id = dto.getId();
		
		if(id!=null) {
			session.removeAttribute("dto");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
