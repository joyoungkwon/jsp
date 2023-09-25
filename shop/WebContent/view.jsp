<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 오브젝트타입이라 캐스팅필요
    	String id = (String)session.getAttribute("user_id");
    	String name = (String)session.getAttribute("user_name");
    	String num = request.getParameter("num");
    	
    	
    	BoardDAO dao = new BoardDAO();
    	BoardDTO dto = new BoardDTO();
    	
    	int result = dao.UpdateVisitCount(num);
    	
    	dto=dao.selectView(num);
    	
    	dao.close();
    	//게시물 조회수 증가
    	// 세부 내용 가져오기
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원 수정</title>
<style>
#col{
	margin-bottom: 20px;
	text-align: center;
	border: 5px solid;
}

</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@ include file="loginCheak.jsp" %>
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상세 게시물 보기</h1>
		</div>
	</div>
	<div class="container" align="center">
	<form action="editBordprocess.jsp" method="post">
		<input type="hidden" name="id" value="<%=dto.getId()%>">
	
		<div class="row-g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="num" class="col-form-label">게시물번호</label>
			</div>
			<div class="col-auto">
				<input type="text" id="num" name="num" class="form-control" value="<%=dto.getNum()%>"readonly="readonly">
			</div>
		</div>
		
		<div class="row-g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="num" class="col-form-label">작성자이름</label>
			</div>
			<div class="col-auto">
				<input type="text" id="num" name="name" class="form-control" value="<%=dto.getName()%>"readonly="readonly">
			</div>
		</div>
		<div class="row-g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="num" class="col-form-label">게시물제목</label>
			</div>
			<div class="col-auto">
				<input type="text" id="num" name="title" class="form-control" value="<%=dto.getTitle()%>">
			</div>
		</div>
		<div class="row-g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="num" class="col-form-label">게시물내용</label>
			</div>
			<div class="col-auto">
				<input type="text" id="num" name="content" class="form-control" value="<%=dto.getContent()%>">
			</div>
		</div>
		<button type="submit">수정하기</button>
		<button type="button" onclick="location.href='delete.jsp';">삭제하기</button>
	</form>
	</div>
</body>
</html>