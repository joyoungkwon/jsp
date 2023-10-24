<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="/menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상세 게시물 보기</h1>
		</div>
	</div>
	<div class="container" align="center">
	${num}
	
	<form action="BoardUpdateAction.do?num=${num}&pageNum=${pageNum}" method="post">
		<div class="row g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="num" class="col-form-label">성명</label>
			</div>
			<div class="col-auto">
				<input type="text" id="num" name="num"
				class="form-control" value="${dto.name}" readonly>
			</div>
		</div>
		
		<div class="row g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="name" class="col-form-label">제목</label>
			</div>
			<div class="col-auto">
				<input type="text" id="subject" name="subject"
				class="form-control" value="${dto.subject}" > 
			</div>
		</div>
		
		<div class="row g-2 align-items-center" id="col">
			<div class="col-auto">
				<label for="content" class="col-form-label">게시물 내용</label>
			</div>
			<div class="col-auto">
				<textarea class="form-control" name="content">${dto.content}</textarea>
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<c:set var="userid" value="${dto.id}"/>
				<c:if test="${user_id eq userid}"> 
					<input type="submit"  class="btn btn-success" value="수정하기">
					<a href="./BoardDeleteAction.do?num=${num}" class="btn btn-danger">삭제하기</a>
				 </c:if>
					<a href="./BoardListAction.do?pageNum=${pageNum}" class="btn btn-primary">목록보기</a>
			</div>
		</div>
	</form>
	</div>
	
</body>
</html>