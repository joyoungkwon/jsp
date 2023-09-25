<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="common.JSFuncton"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="loginCheak.jsp" %>
<body>
	<%
		// BoardDTO 의 postdate가 String타입일때.
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String user_id = (String)session.getAttribute("user_id");
		
		// SimpleDateFormat = cutdateforamt = new SimpleDateFormat("yyyy-MM-dd");
		//	String postdate = curdateforamt.foramt(new Date());
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(user_id);
		// dto.setPostdate(postdate);
		
		int result = dao.insertWrite(dto);
		
		if(result==1){
			JSFuncton.alertLocation("게시물추가성공", "boardmain.jsp", out);
		}else{
			JSFuncton.alertBack("게시물추가실패", out);
		}
	
		dao.close();
	%>
</body>
</html>