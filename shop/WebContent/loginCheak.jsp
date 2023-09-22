<%@page import="common.JSFuncton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(session.getAttribute("user_id")==null){
		JSFuncton.alertLocation("로그인후 이용", "login.jsp", out);
		return;
	}
%>