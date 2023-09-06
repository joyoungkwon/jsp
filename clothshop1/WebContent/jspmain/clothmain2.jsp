<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	ClothRepository pro = new ClothRepository();
	Cloth cloth = pro.getClothById(id);
	%>
	<img src="../resources/images/<%=cloth.getClothId()%>.jpg">
	<h3>이름<%=cloth.getClohtName()%></h3>
	<h3>색깔<%=cloth.getClothColor() %></h3>
	<h3>가격<%=cloth.getClothCost() %></h3>
	<h3>아이디<%=cloth.getClothId()%></h3>
	<h3>사이즈<%=cloth.getClothSize()%></h3>
</body>
</html>