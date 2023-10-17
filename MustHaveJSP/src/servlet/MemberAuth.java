package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import Membership.MemberDAO;
import Membership.MemberDTO;
import utils.JSFuncton;


public class MemberAuth extends HttpServlet {
    
    MemberDAO dao;

	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl,oId,oPass);
		
		
	}
	@Override
	public void destroy() {
		dao.close();
		
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id"); // web파일 설정해놓은
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = dao.getMemberDTO(id, pw);
		
		String memberName = dto.getName();
		
		if(memberName!=null) {
			request.setAttribute("authMessage", memberName +"횐님반갑습니다");
		}else {
			if(admin_id.equals(id)) {
				request.setAttribute("authMessage", admin_id+"관리자 권환으로 로그인 하셨습니다");
			}else {
				request.setAttribute("authMessage", "회원이 아닙니다 ");
			}
		}
		request.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(request, response);
	}
	
	

}
