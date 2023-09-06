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
		Cloth cloth = new Cloth();
		ClothRepository dto = new ClothRepository();
		
		ArrayList <Cloth> listOfCloth = dto.getAllList();
		
		for(int i = 0 ; i<listOfCloth.size(); i++){
			 cloth = listOfCloth.get(i);
		
	%>
		<img src="../resources/images/<%=cloth.getClothId()%>.jpg">
		<a href="clothmain2.jsp?id=<%=cloth.getClothId() %> ">상세정보</a>
		<h3><%=cloth.getClothId()%></h3>
	 	<h3><%=cloth.getClohtName()%></h3>
 	<%
		}
 	%>
</body>
</html>