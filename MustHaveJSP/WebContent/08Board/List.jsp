<%@page import="model1.Board.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.*" %>
<%@page import="model1.Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    
    	// BoarDao 에 어플리케이션을 받고 설정해서 오라클데이터베이스에 연동하는 객체생성하고
    	
    	
    	BoardDAO dao = new BoardDAO(application);
    	// 맵 으로 param이라는 맵을 생성 하고 키값을 String그리고 벨류값을 Object값을 불러오는
    	// param이라는 맵을 설정하고
    	Map<String,Object> param = new HashMap<String,Object>();
    	
    	String sercahWord = request.getParameter("sercahWord");
    	String sercahField = request.getParameter("sercahField");
    	
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
<%--jsp include common link jsp 파일 인쿠르드 --%>
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
				// 만약 보더 리스트가 비어있으면 
				// isempty로 비어있는지 유무 확인
		%>
			<tr>
				<td colspan="5" align="center">
					해당 내용이 없습니다.
				</td>
			</tr>
			
		<%}else{
			int virtualNum =0;
			// 가상번호를 생성함 (db에 있는 넘버 말고 화면상에서 출력한 번호값 변수를 새로 생성하고 초기화)
			// BoardDTO dto객체에 boardList의 갯수만큼 저장시킨다.
			for(BoardDTO dto : boardList){
				// 전체 개수의 개수에서 높은곳에서 낮은곳으로 출력하기 때문에 토탈 카운트에서 --를 해서 순번을 위에서
				// 아래로 나열할때 -1씩 해서 virtualNum에 출력하기 위해서 저장시킴
				virtualNum = totalCount--;
			%>
			<tr align="center">
				<td><%=virtualNum %></td>
				<td align="left">
					<a href="#"><%=dto.getTitle() %></a>
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
			<%-- 자바스크립트 onclick = 보내는값 Write.jsp로. --%>
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	
	</table>
	

</body>
</html>