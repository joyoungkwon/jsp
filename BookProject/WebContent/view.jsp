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
	// bookmain에서 보낸 bookid값을 받아와서
		String bookid = request.getParameter("id");
		
		BookinfoDAO dao = new BookinfoDAO();
		
		// 받아온값으로 dto에 저장시킴 list형태와 받는 리턴타입이 다른이유는
		// bookid라는 고유 값으로 파라미터값을 받고, sql조건문에 테이블이 갖는 고유값으로검색했기때문에
		// 검색결과가 하나임 그래서 dto에받는거임.
		BookinfoDTO dto = dao.selectView(bookid);
	%>
	<table border="1">
		<tr>
			<td>도서아이디<%=dto.getBookid() %></td>
			<td>작가<%=dto.getAuthor()%></td>
			<td>도서제목<%=dto.getBooktitle() %></td>
			<td>도서내용<%=dto.getBookcontent() %></td>
			<td>도서가격<%=dto.getBookprice()%></td>
		</tr>
	</table>
	<input type="button" value="책정보삭제" onclick="location.href='deletebookinfo.jsp?bookid=<%=dto.getBookid()%>';">
</body>
</html>