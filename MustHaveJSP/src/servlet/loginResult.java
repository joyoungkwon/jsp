package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginResult extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("id", "joyoungkwon");
		request.setAttribute("pw", "1234");
		
		request.getRequestDispatcher("/13Servlet/loginResult.jsp").forward(request, response);
		
	}

}
