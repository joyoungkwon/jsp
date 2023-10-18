<%@page import="model1.Board.BoardDTO"%>
<%@page import="model1.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<%--페이지 인쿠르드하고 dto에 저장되있는 값불러오기 --%>
<body>
	<h2>파일 첨부형 비회원제 게시판 상세보기</h2>
	
		<table border="1" width="90%">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="*%">
		</colgroup>
		
			<tr>
				<td>번호</td>
				<td>${dto.idx}</td>
				<td>작성자</td>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${dto.postdate}</td>
				<td>조회수</td>
				<td>${dto.visitcount}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${dto.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100">
				${dto.content}
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${ not empty dto.ofile}">
						${dto.ofile}
						<a href="../mvcboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">[다운]</a>
					</c:if>
				</td>
				<td>다운로드수</td>
				<td>${dto.downcount}</td>
			</tr>
			<tr >
				<td colspan="4" align="center">
				<%--JSTL core태그로 대채할듯 --%>
					<%-- <%
						if(session.getAttribute("UserId")!=null &&session.getAttribute("UserId")
						.toString().equalsIgnoreCase(dto.getId())){
					
					%>  --%>
					<button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">수정하기</button>
					<button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}';">삭제하기</button>
					
				<%--JSTL core태그로 대채할듯 --%>
				<%-- <%
						}
				%> --%>
					<button type="button" onclick="location.href='../mvcboard/list.do';">목록보기</button>
				</td>
			</tr>
		</table>
	
</body>
</html>