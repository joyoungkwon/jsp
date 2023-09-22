<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="loginCheak.jsp" />
	
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">삭제할 상품 아이디입력</h5>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.print("<div class='alert alert-danger'>");
					out.print("해당상품없음");
					out.print("</div>");
				}
			%>
			<form class="form-signin" action="processDeleteProduct.jsp" method="post">

				<div class="form-group">
					<input type="text" class="form-control" placeholder="상품아이디" 
					name="p_id" required autofocus>
				</div>
				
				<button class="btn btn-lg btn-success btn-block" 
					type="submit">상품삭제</button>
			</form>
		</div>
	</div>
	
</body>
</html>