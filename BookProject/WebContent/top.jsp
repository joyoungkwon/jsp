<%@page import="DTO.MemberShipDTO"%>
<%@page import="DAO.memberShipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
	
	String userid = (String)session.getAttribute("userid");
		
		if(userid == null){
			out.print("<a href='login.jsp'>로그인</a>");
			out.print(" ");
			out.print("<a href='addmember.jsp'>회원가입</a>");
		}else{
			out.print("<a href='logout.jsp'>로그아웃</a>");
			out.print(" ");
			out.print("<a href='deletemember.jsp'>회원탈퇴</a>");
			out.print(" ");
			out.print("<a href='bookmain.jsp'>도서목록보기</a>");
		}
		
	
	%>
</body>
</html>