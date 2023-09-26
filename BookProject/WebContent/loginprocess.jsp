<%@page import="common.JSFuncton"%>
<%@page import="DAO.memberShipDAO"%>
<%@page import="DTO.MemberShipDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		
		
		memberShipDAO dao = new memberShipDAO();
		MemberShipDTO dto = dao.selectMember(id, pw);
		
	
		if(id.equals(dto.getMemberid())&&pw.equals(dto.getMemberpw())){
			out.print(dto.getMembername()+"님 환영 합니다");
			session.setAttribute("userid", id);
			
		}else{
			JSFuncton.alertBack("아이디나 비밀번호가 맞지 않습니다.", out);
		}
		
	
	%>
</body>
</html>