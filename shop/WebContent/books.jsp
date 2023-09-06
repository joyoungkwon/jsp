<%@page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dto.BookRepository"%>
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
		BookRepository bkr = new BookRepository();
		ArrayList<Book> booklist = bkr.getListAll();
	%>

	<%
		// 향상된 포문.
		for (Book book : booklist) {
	%>
	<h3>
		도서종류:<%=book.getBookid()%></h3>
	<h3>
		도서이름:<%=book.getBookName()%></h3>
	<h3>
		도서가격:<%=book.getBookPrice()%></h3>
	<br>
	<%
		}
	%>
</body>
</html>