<%@page import="common.JSFuncton"%>
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
		String id = request.getParameter("id");
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		String memberid = request.getParameter("memberid");
		
		int result = 0;
		BookinfoDAO dao = new BookinfoDAO();
		result = dao.insertbook(id, author, title, content, price, date, memberid);
		
		if(result==1){
			JSFuncton.alertLocation("도서 추가 되었습니다", "bookmain.jsp", out);
		}else{
			JSFuncton.alertBack("도서추가 실패 했습니다.", out);
		}
		
	
	%>
</body>
</html>