<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// userid의 값을 지우는것
	// userName의 값을 지우는것 
	//remove.
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	
	
	//세션 자체를 삭제
	//invalidate();
	// 세션이 담고있는 그 틀자체를 삭제.
	session.invalidate();
	
	response.sendRedirect("LoginForm.jsp");

%>