<%@page import="common.JSFuncton"%>
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
	
		String id = request.getParameter("id");
		String pw =request.getParameter("pw");
		
		memberShipDAO dao = new memberShipDAO();
		
		int result =0;
		
		result =dao.deleteMember(id, pw);
		
		if(result==1){
			JSFuncton.alertLocation("회원삭제완료", "login.jsp", out);
		}else{
			JSFuncton.alertBack("회원삭제실패", out);
		}
		
		
	
	%>
</body>
</html>