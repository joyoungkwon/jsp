<%@page import="common.JSFuncton"%>
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
	
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		memberShipDAO dao = new memberShipDAO();
		
		int result =0;
		
		result = dao.insertMember(id, pw, name, address, tel);
		
		if(result==1){
			JSFuncton.alertLocation("회원추가성공", "login.jsp", out);
		}else{
			JSFuncton.alertBack("회원추가실패", out);
		}
		
	%>
	
		
		
	
	
</body>
</html>