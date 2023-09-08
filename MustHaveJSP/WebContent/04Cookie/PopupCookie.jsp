<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// popupMain 에서 넘긴 inactiveToday을 받아와 chkVal로 저장
	String chkVal = request.getParameter("inactiveToday");


	// 받아온값이 null 이 아니면서 1값을 충족했을때
	// 새로운 쿠키 PopupClose의 off값을 저장하고
	// 쿠키의 패치와 쿠키 삭제 시간값을 20초로 설정하고
	// reponse로 add 방금 설정한 쿠키값을 저장하고
	// 오늘 하루열지않음으로 체크
	
	if(chkVal != null && chkVal.equals("1")){
		Cookie cookie = new Cookie("PopupClose","off");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(20);
		response.addCookie(cookie);
		out.print("오늘 하루열지않음");
	}



%>