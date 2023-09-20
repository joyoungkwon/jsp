<%@page import="utils.JSFuncton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("UserId")==null){
		JSFuncton.alertLocation("로그인 후 이용하세요", "../06Session/LoginForm.jsp", out);
		return;
	}

%>