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

<%--쓰인 deletePost(dto) 메서드 --%>
<%
	String num = request.getParameter("num");
	
	
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	
	
	BoardDAO dao = new BoardDAO(application);
	dto = dao.selectView(num);
	
	String sessionId = (String)session.getAttribute("UserId");
	int delResult =0;
	// deletePost(dto) 메서드
	if(sessionId.equals(dto.getId())){
		dto.setNum(num);
		delResult = dao.deletePost(dto);
		dao.close();
	}
	
	if(delResult==1){
		JSFuncton.alertLocation("삭제되었습니다", "List.jsp", out);
	}else{
		JSFuncton.alertBack("삭제오류", out);
	}

%>

</head>
<body>
</body>
</html>