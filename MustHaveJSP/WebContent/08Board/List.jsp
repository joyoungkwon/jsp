<%@page import="model1.Board.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.*" %>
<%@page import="model1.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--맨처음에는 바로밑에 있는 스트립틀립이 실행이 되지않음, 값을 넣고 새로고침 해서
    	밑에 설정해둔 sercahField sercahWord 값을 받아와 sercahWord 의 값이 있을떄
    	조건문을걸고 실행하는 메서드. 만약 값이 있을시에 parm이라는 맵 타입 플레임워크에, String타입으로
    	변수를 설정하고 벨류값을 request.getParmeter로 끌어온 벨류값을 대입시킴.
    	그리고 total카운트에 selectCount(map) 메서드를 실행.
    	
     --%>
    <%
    	BoardDAO dao = new BoardDAO(application);
    	Map<String,Object> param = new HashMap<String,Object>();
    	
    	String sercahField = request.getParameter("sercahField");
    	String sercahWord = request.getParameter("sercahWord");
    	
    	if(sercahWord!=null){
    		param.put("sercahWord", sercahWord);
    		param.put("sercahField", sercahField);
    	}
    	
    	int totalCount = dao.selectCount(param);
    	
    	List<BoardDTO> boardList = dao.selectList(param);
    	
    	dao.close();
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"></jsp:include>
	<h2>목록보기</h2>
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="sercahField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="sercahWord"/>
					<input type="submit" value="검색하기"/>
				</td>
			</tr>
		</table>
	</form>
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<%
			if(boardList.isEmpty()){
		%>
			<tr>
				<td colspan="5" align="center">
					해당 내용이 없습니다.
				</td>
			</tr>
		
			
		<%}else{
			int virtualNum =0;
			for(BoardDTO dto : boardList){
				virtualNum = totalCount--;
			%>
			<tr align="center">
				<td><%=virtualNum %></td>
				<td align="left">
				<a href="View.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>
				</td>
				<td align="center"><%=dto.getId() %> </td> 
				<td align="center"><%=dto.getVisitcount() %> </td> 
				<td align="center"><%=dto.getPostdate()%> </td> 
			</tr>
			<%
			}
		 }
		 %>
	</table>
	<table border="1" width="90%">
		<tr>
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	
	</table>
</body>
</html>