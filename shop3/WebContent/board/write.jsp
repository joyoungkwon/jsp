<%@page import="mvc.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1 class="display-3">글쓰기</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-5">
			<form name="newWrite" class="form-signin" action="./BoardWriteAction.do" method="post">

				<div class="form-group">
					<label class="sr-only">아이디</label> 
					<input type="text" class="form-control" placeholder="아이디" 
					name="id" id="id"value="${user_id}" readonly>
				</div>
				<div class="form-group">
					<label  class="sr-only">작성자</label> 
					<input type="text" class="form-control" 
					placeholder="이름" name="name" value="${user_name}">
				</div>
				<div class="form-group">
					<label class="sr-only">제목</label> 
					<input type="text" class="form-control" 
					placeholder="제목" name="subject" >
				</div>
				<div class="form-group">
					<label  class="sr-only">내용</label> 
					<input type="text" class="form-control" 
					placeholder="내용" name="content" >
				</div>
				<button class="btn btn-primary" 
					type="submit">등록</button>
				<button class="btn btn-primary" 
					type="reset">취소</button>
			</form>
		</div>
	</div>
	


</body>
</html>