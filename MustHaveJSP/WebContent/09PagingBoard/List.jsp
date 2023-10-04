<%@page import="model1.Board.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.*" %>
<%@page import="model1.Board.BoardDAO"%>
<%@page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	BoardDAO dao = new BoardDAO(application);
    	Map<String,Object> param = new HashMap<String,Object>();
    	
    	String sercahField = request.getParameter("sercahField");
    	String sercahWord = request.getParameter("sercahWord");
    	
    	if(sercahWord!=null){
    		param.put("sercahWord", sercahWord);
    		param.put("sercahField", sercahField);
    	}
    	
    	//전체 게시물 개수를 저장
    	int totalCount = dao.selectCount(param);
    	// web파일에서 설정한 페이지당 출력 게시물 (목록이 눈에 보이는 게시물)(10개로 세팅)
    	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    	// web파일에서 설정한 페이지 목록 보기의 수 5개로 세팅
    	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    	// 전체 행의 10으로 나눔 소수점이 나와야 오름차순 하기때문에 더블로 바꿧다 다시 int로 바꿈
    	int totalPage = (int)Math.ceil((double)totalCount/pageSize);
    	
    	int pageNum = 1; // 페이지 번호 초기값을 설정
    	String pageTemp = request.getParameter("pageNum");// 사용자가 클릭한 페이지 번호를 가져와 pageNum의 저장함
    	
    	if(pageTemp!=null && !pageTemp.equals(" ")){
    		pageNum = Integer.parseInt(pageTemp);
    	}
    	//각페이지의 시작번호와 끝번호를 설정 (dao메서드 안에 map안에 저장된 start,end String 키로 value값을 설정)
    	// 시작번호 공식
    	int start = (pageNum-1)*pageSize +1;
    	// 끝번호 공식
    	int end  = pageNum * pageSize;
    	
    	param.put("start", start);
    	param.put("end", end);
    	
    	
    	
    	List<BoardDTO> boardList = dao.selectList(param);
    	
    	dao.close();
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#a a{
	text-decoration: none;
	color : black;
}
#a{
	color: red;
}

</style>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"></jsp:include>
	<h2>목록보기- 현제 페이지:<%=pageNum%>(전체:<%=totalPage%>)</h2>
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
			int countNum=0;
			for(BoardDTO dto : boardList){
				//virtualNum = totalCount--;
				virtualNum = totalCount - (((pageNum-1)*pageSize) + countNum++);
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
		<tr align="center">
			<td id="a">
				<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>
	
</body>
</html>