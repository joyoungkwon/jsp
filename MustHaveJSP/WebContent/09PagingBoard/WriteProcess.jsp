<%@page import="model1.Board.BoardDTO"%>
<%@page import="model1.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="IsLoggedIn.jsp" %> 
<%
	//
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	BoardDTO dto = new BoardDTO();
	
	dto.setTitle(title);
	dto.setContent(content);
	
	dto.setId(session.getAttribute("UserId").toString());
	
	
	BoardDAO dao = new BoardDAO(application);
	
	int iResult = dao.insertWrite(dto);
	// 포문을이용해서 한번입력으로 100번 입력되게끔 만들기
	//int iResult =0;
	//for(int i = 1; i<=100; i++){
		//dto.setTitle(title+"-"+i);
			//iResult =dao.insertWrite(dto);
	//}
	dao.close();
	
	if(iResult==1){
		response.sendRedirect("List.jsp");
	}else{
		JSFuncton.alertBack("글쓰기실패", out);
	}

%>