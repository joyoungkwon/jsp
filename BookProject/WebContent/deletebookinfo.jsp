<%@page import="common.JSFuncton"%>
<%@page import="DTO.BookinfoDTO"%>
<%@page import="DAO.BookinfoDAO"%>
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
	String bookid = request.getParameter("bookid");
	int result =0;
	BookinfoDAO dao = new BookinfoDAO();
	
	 result = dao.deletebookinfo(bookid);
	
	if(result ==1){
		JSFuncton.alertLocation("책정보내용이삭제되었습니다", "bookmain.jsp", out);
	}else{
		JSFuncton.alertBack("책내용정보삭제실패했습니다", out);
	}

%>
</body>
</html>