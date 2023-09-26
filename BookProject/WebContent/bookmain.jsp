<%@page import="java.util.ArrayList"%>
<%@page import="DTO.BookinfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BookinfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="top.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,tr,td{
	border: 1px solid black;
	text-align: center;
	margin: 10px;
}
button {
	margin: auto;
}
</style>
</head>
<body>
	<%
		BookinfoDAO dao = new BookinfoDAO();
		BookinfoDTO dto = new BookinfoDTO();
		List<BookinfoDTO> booklist = new ArrayList<>();
		
		
		booklist = dao.selectBook(dto);
	
	%>
	
	<form action="#">
		<table>
			<tr>
				<td>도서아이디</td>				
				<td>작가</td>				
				<td>도서제목</td>				
				<td>도서내용</td>				
			</tr>
			
			<%
				for(BookinfoDTO dto2 : booklist){
			
			%>
			<tr>
				<td><%=dto2.getBookid()%></td>				
				<td><%=dto2.getAuthor()%></td>				
				<td><a href="view.jsp?id=<%=dto2.getBookid()%>"><%=dto2.getBooktitle() %></a></td>
				<td><%= dto2.getBookcontent()%></td>	
			</tr>
			
			<%} %>
		</table>
		<input type="button" value="도서추가" onclick="location.href='addbook.jsp';">
	</form>
</body>
</html>