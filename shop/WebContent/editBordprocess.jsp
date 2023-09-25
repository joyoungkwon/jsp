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
<body>
	<%
		String user_id = session.getAttribute("user_id").toString();
		
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		BoardDAO dao= new BoardDAO();
		BoardDTO dto = dao.selectView(num);
		
		
		
		if(dto.getId().equals(session.getAttribute("user_id").toString())){
			
			dto.setNum(num);
			dto.setTitle(title);
			dto.setContent(content);
			
			JSFuncton.alertLocation("수정이완료되었습니다", "boardmain.jsp", out);
		}else{
			JSFuncton.alertBack("게시물 수정 실패 작성자 본인만 수정할수 있습니다.", out);
		}
		dao.close();
		
	%>

</body>
</html>