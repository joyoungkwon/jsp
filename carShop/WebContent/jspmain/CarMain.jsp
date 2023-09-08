<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%-- 메인의 뿌려주기 3개의 이미지 거기에 img 엥커 태그 걸고 누르면 상세정보 나오게 하기. --%>
	
	<%
		Car car = new Car();
		CarRepository dto = new CarRepository().getinstance();
		ArrayList <Car> carList = dto.CarListAll();
		
		for(int i =0; i<carList.size();i++){
			car = carList.get(i);
	%>
		<a href="CarMain2.jsp?id=<%=car.getCarId()%>">
		<img src="../resources/images/<%=car.getCarId()%>.jpg" >
		</a>
		<h1> 자동차 상품 소개  :  <%=car.getCarName() %></h1>
	<%
	
		}
	%>
		<a href="CarMenu.jsp">자동차 등록하기</a>
</body>
</html>