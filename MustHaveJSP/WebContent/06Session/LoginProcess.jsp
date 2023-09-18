<%@page import="Membership.MemberDTO"%>
<%@page import="Membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 폼에서 보낸 id,pw 값 받고
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	// web에서 설정한 oracle 값 어플리케이션 영역으로 getInitParameter 로 받고
	String OracleDriver = application.getInitParameter("OracleDriver");
	String OracleURL = application.getInitParameter("OracleURL");
	String OracleId = application.getInitParameter("OracleId");
	String OraclePwd = application.getInitParameter("OraclePwd");
	
	// DAO 파라미터 값 넣어서 생성 하고 커넥션 으로 해서 데이터베이스 연동
	MemberDAO dao = new MemberDAO(OracleDriver,OracleURL,OracleId,OraclePwd);
	// DTO에 있는 SQL테이블 검색 문 해서 ID 와 PW값 가져와서
	MemberDTO memberDto = dao.getMemberDTO(id,pw);
	// 자원 해제
	dao.close();
	
	// RS객체의 담겨있는 getid 값이아니면 (같은요소가있을때)
	if(memberDto.getId()!=null){
		// UserId,userName의 각각 id값과 name을 저장하고 돌아가라.
		session.setAttribute("UserId", memberDto.getId());
		session.setAttribute("UserName", memberDto.getName());
		response.sendRedirect("LoginForm.jsp");
	}else{
		request.setAttribute("LoginErrMsg", "로그인 오류");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>