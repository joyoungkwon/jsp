<%@page import="DAO.BookinfoDAO"%>
<%@page import="DTO.BookinfoDTO"%>
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
		String bookid = request.getParameter("id");
		
		BookinfoDAO dao = new BookinfoDAO();
		
		
		BookinfoDTO dto = dao.selectView(bookid);
	%>
	<table border="1">
		<tr>
			<td>도서아이디<%=dto.getBookid() %></td>
			<td>작가<%=dto.getAuthor()%></td>
			<td>도서제목<%=dto.getBooktitle() %></td>
			<td>도서내용<%=dto.getBookcontent() %></td>
		</tr>
	</table>
</body>
</html>