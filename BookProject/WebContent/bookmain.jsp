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
	
		BookinfoDAO dao = new BookinfoDAO(); // 데이터베이스연결
		BookinfoDTO dto = new BookinfoDTO();	// 받을dto객체선언
		List<BookinfoDTO> booklist = new ArrayList<>(); // dao.selectBook(dto)를 받을 booklist선언
		
		
		booklist = dao.selectBook(dto);// dao.selectBook는 dto를 파라미터로 받아서 Bookinfo에
		// 모든 테이블을 검색하고 검색한 결과값을 반복문을 이용해 필드값을 모두 새로운 dto에 클래스로 저장한걸 다시
		// list의 i번째 방마다 저장한결과값을 리턴한 메서드
		
		// 를 booklist로 저장.
	
	%>
	
	<form action="#">
		<table>
			<tr>
				<td>도서아이디</td>				
				<td>작가</td>				
				<td>도서제목</td>				
				<td>도서내용</td>				
			</tr>
			<%-- booklist의 검색결과 모든 bookinfo에 검색결과를 list방에 클래스 식으로 받아서 
			뿌릴때도 dto를 다시 선언해 클래스 타입으로 뿌려주기 첫번쨰 북리스트가 dto2의 첫번째 클래스를 만나 찢어지고
			 그 dto2의 get메서드를 이용해 첫번째 booklist로 형성된 값을 dto2로 받아뿌려주기--%>
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
		<%--onclick="location.href='addbook.jsp';"> 식으로 로케이션함수를 이용하는 방법도 있음
		--%>
		<input type="button" value="도서추가" onclick="location.href='addbook.jsp';">
	</form>
</body>
</html>