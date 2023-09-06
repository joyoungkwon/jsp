<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바 파일 임포트 지시어 -->
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductRepository"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품정보</title>
</head>
<body>
	<%
		//저장되어있는 값 객체 생성후 3개 저장되어있는 값 가져오기
		ProductRepository dao = new ProductRepository();
		// productRepostory 안에 있는 phone notebook tablet 저장되어 있는 값을 
		// productRepostory getAllproducts() 메소드로 모두 호출 한후 그 값을 
		// listOfProducts의 저장함.
		ArrayList<Product> listOfProducts =dao.getAllProducts();
		//검색
	%>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
		
		<%
			// arrayList의 저장되어있는 값만큼 반복 lenth x size O
			
			
			for(int i =0; i< listOfProducts.size();i++){
				// Product 타입으로 listOfProducts 을 i번 째 방마다 가져옴
				Product product = listOfProducts.get(i);
				String img = "P123"+(i+4);
				
		%>
			<div class="col-md-4">
				<img src="resources/images/<%=img%>.jpg" style="width: 100%">
				<h3><%=product.getPname() %></h3>
				<h3><%=product.getDescription()%></h3>
				<h3><%=product.getUnitPrice() %></h3>
				<p>
				<a href="product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">상세정보</a>
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











