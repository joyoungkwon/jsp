<%@page import="common.JSFuncton"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
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
		String num = request.getParameter("num");
		String user_id = (String)session.getAttribute("user_id");
	
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		
		//BoardDTO dto = dao.selectView(num);
		//dto에 막바로 넘버값으로 검색한거대입
		
		dto.setNum(num);
		if(user_id.equals(session.getAttribute("user_id").toString())){
			dto = dao.selectView(num);
			
			dto.setNum(num);
			dao.deleteBoard(dto);
			JSFuncton.alertLocation("해당내용이 삭제 되었습니다", "boardmain.jsp", out);
		}else{
			JSFuncton.alertBack("작성자본인만 삭제 할수 있습니다.", out);
		}
	dao.close();
	
	%>
</body>
</html>