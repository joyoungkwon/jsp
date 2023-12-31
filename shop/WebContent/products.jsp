<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="loginCheak.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	
	<%
		// ProductRepostiroy 의 selectProduct를 호출 할려고 객체 생성하고
		// dao로 생성함 생성한후 selectProduct 메서드 생성
		ProductRepository dao = new ProductRepository();// mysql디비연동
		dao.selectProduct();
		//전체 검색 메서드
		ArrayList<Product> listOfProducts = dao.getAllProducts();
		dao.close();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for (int i=0; i<listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
				<div class="col-md-4">
					<img src="resources/images/<%=product.getProductId()%>.png">
					<h3><%=product.getPname()%></h3>
					<h3><%=product.getDescription()%></h3>
					<h3><%=product.getUnitPrice()%></h3>
					<p> 
					<a href="product.jsp?id=<%=product.getProductId()%>"
					class="btn btn-secondary" role="button">상세 정보</a>
					</p>
				</div>
			<%	
				}
			%>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>











