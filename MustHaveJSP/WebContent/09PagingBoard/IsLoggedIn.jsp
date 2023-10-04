<%@page import="utils.JSFuncton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--세션을 설정한 값으로 판단하는 조건문 (세션값으로 세팅된 로그인여부를 확인하는 값.) --%>
<%
	if(session.getAttribute("UserId")==null){
		JSFuncton.alertLocation("로그인 후 이용하세요", "../06Session/LoginForm.jsp", out);
		return;
	}

%>