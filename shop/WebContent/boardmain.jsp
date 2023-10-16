<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.BoardPage"%>
<%@page import="java.util.List"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<%

	
	BoardDAO dao = new BoardDAO();//db연결
	BoardDTO dto = new BoardDTO();
	
	
	
	// 웹파일에 내가 설정해놓은 게시물 출력갯수 
	int posts_page = Integer.parseInt(application.getInitParameter("POSTS_PAGE")); 
	// 웹파일에 내가 설정해놓은 게시물 목록 블록 출력갯수
	int block_count = Integer.parseInt(application.getInitParameter("BLOCK_COUNT"));
	// 전체 페이지 갯수
	
	int pageNum =1; 
	// 초기값 세팅
	// 메뉴에서 pageNum값 보낸거 받아와서 치완시키기
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	// 시작 값과
	int start =(pageNum-1) * posts_page + 1;
	// 끝값 지정하고
	
	// 수정한 메서드 파라미터값으로 넘기기
	Map<String,Object> searchMap = (Map)session.getAttribute("searchMap");
	
	List<BoardDTO> boardLists = dao.selectList(start, searchMap); 
	int totalCount = dao.selectCount(searchMap);
	int toatalpage = (int)Math.ceil((double)totalCount/posts_page);
	
	int pageTemp = (((pageNum-1)/block_count)*block_count)+1; // 현재 내가 머물고 있는 페이지
	
	
	dao.close();// db연결 닫기.
	
	
%>
</head>
<body>
<c:url value="boardmain.jsp" var="url"/>
<%@ include file="menu.jsp" %>
<%@ include file="loginCheak.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<form action="serchprocess.jsp" method="post">
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
			<%-- <%
			if(boardLists.isEmpty()){
			
			%>
			
			 	<p> 해당게시물이 없습니다.</p> 
			
			<%
			}else{
				
				 int virtualNumber =0; // 가상번호
				int CountNum =0; //? */
				
				
				 for(BoardDTO bto : boardLists){
					
					virtualNumber = totalCount -((pageNum-1)*toatalpage)+CountNum--; 
			
			%> --%>
			<%-- <tr align="center">
				<td><%=virtualNumber %></td>
					<td><a href ="view.jsp?num=<%=bto.getNum()%>"><%=bto.getTitle() %></a></td>
				<td><%=bto.getId() %></td>
				<td><%=bto.getVisitcount() %></td>
				<td><%=bto.getPostdate() %></td>
				
			</tr> --%>
			
			<c:forEach var="bordli" items="<%=boardLists%>">
				<tr>
					<td>${bordli.num}</td>
					<td><a href="view.jsp?num=${bordli.num}">${bordli.title}</a></td>
					<td>${bordli.id}</td>
					<td>${bordli.visitcount}</td>
					<td>${bordli.postdate}</td>
				</tr>
			</c:forEach>
			<%-- <%
			
			 }
				
			}
			%> --%>
			
			
			
			<tr align="center">
				<%-- <td colspan="5">
					<%=BoardPage.paginStr(posts_page, block_count, pageNum, toatalpage)%> 
				</td> --%>
				<td colspan="5">
					<c:set var="pageTemp" value="<%=pageTemp%>"/>
					<c:forEach begin="1" end="<%=block_count%>" var="i">
						<c:choose>
							<c:when test="${i eq pageTemp}">
								<a href="${url}?pageNum=1" style="color: red;">[처음으로]</a>
							</c:when>
							<c:otherwise>
									<a href="${url}?pageNum=${i}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:set var="pageNum2" value="<%=pageNum%>"/>
						<c:if test="${$pageTemp!= 1}">
							<a href="${url}?pageNum=${pageNum2+1}"style="color: red;">[다음]</a>
						</c:if>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="5">
					<select name="sel" class="txt">
						<option value="id">아이디</option>
						<option value="title">제목</option>
					</select>
					<input name="text" type="text">
					<input  type="submit" class="btn btn-primary" value="검색">
				</td>
			</tr>
		</table>
		<br>
		<div align="center">
		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
		</div>	
	</div>
	</form>
</body>
</html>