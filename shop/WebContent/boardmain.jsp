<%@page import="java.util.List"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<%
	BoardDAO dao = new BoardDAO();//db연결
	
	List<BoardDTO> boardLists = dao.selectList();
	dao.close();// db연결 닫기.
	
%>
</head>
<body>
<%@ include file="menu.jsp" %>
<%@ include file="loginCheak.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<table border="1" width="90%">
			<tr align="center">
				<td width="10%">번호</td>
				<td width="50%">제목</td>
				<td width="15%">아이디</td>
				<td width="10%">조회수</td>
				<td width="15%">작성일</td>
			</tr>
			<%--boardLists에 결과 요소가 없을시. --%>
			<%
			if(boardLists.isEmpty()){
			
			%>
			
			 	<p>해당게시물이 없습니다.</p>
			
			<%
			}else{
				
				for(BoardDTO bto : boardLists){
			
			%>
			<tr align="center">
				<td><%=bto.getNum() %></td>
					<td><a href ="view.jsp?num=<%=bto.getNum()%>"><%=bto.getTitle() %></a></td>
				<td><%=bto.getId() %></td>
				<td><%=bto.getVisitcount() %></td>
				<td><%=bto.getPostdate() %></td>
				
			</tr>
			<%
			 }
				
			}
			%>
		</table>
		<br>
		
		<div align="center">
		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
		</div>	
	</div>
</body>
</html>