<%@page import="model1.Board.BoardDAO"%>
<%@page import="model1.Board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO(application);
	
	int rs = dao.UpdateEdit(dto);
	dao.close();
	
	if(rs==1){
		response.sendRedirect("View.jsp?num="+dto.getNum());
	}else{
		JSFuncton.alertBack("수정하기실패했습니다", out);
	}

%>

</head>
<body>
</body>
</html>