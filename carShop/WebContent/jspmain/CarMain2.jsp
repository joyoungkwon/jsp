<%@page import="dto.CarRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stlyesheet" href="../resources/css/Stlye.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		CarRepository crt = new CarRepository();
		Car  car = crt.CarbyId(id);
	%>
		<img src="../resources/images/<%=id %>.jpg">
		<h1>자동차 이름 : <%=car.getCarName() %></h1>
		<p>색상 : <%=car.getColor() %></p>
		<p>제조회사 : <%=car.getCompany() %></p>
		<p>가격: <%=car.getCost() %>천만원</p>
	
</body>
</html>