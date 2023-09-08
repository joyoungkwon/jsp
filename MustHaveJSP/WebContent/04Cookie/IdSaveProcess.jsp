<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="utils.*" %>
<!DOCTYPE html>

<body>
	<%
		//아이디 비번 체크값을 가져옴.
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String save_check = request.getParameter("save_check");
		
		// user_id가 같을지 java = 1234 인지.
		// 세이브체크의값이 null이 아니면서 value값 y를 가지고 있을때
		// 쿠키 만드는 메서드를 호출하고 쿠키 생성.
		// 로그인성공 js함수 경고창 호출
		// 아니면 딜리트 메서드 호출해서 loginId의 값을 ""로 변경하고 유지시간을 0초로 세팅
		// 로그인실패 자바스크립트 함수 경고창 호출
		if(user_id.equalsIgnoreCase("java") && user_pw.equalsIgnoreCase("1234")){
			if(save_check != null && save_check.equals("Y")){
				CookieManager.makeCookie(response, "loginId", user_id, 86400);
			}else{
				CookieManager.deleteCookie(response, "loginId");
			}
			JSFuncton.alertLocation("로그인의 성공 했습니다", "IdSaveMain.jsp", out);
		}else{
			JSFuncton.alertBack("로그인 실패입니다.", out);
		}
	%>
