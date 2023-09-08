<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="abc">
		<div>
		id:	<input type="text" name="carId"><br>
		name:<input type="text" name="carName"><br>
		color:<input type="text" name="color"><br>
		cost:<input type="text" name="cost"><br>
		company :<input type="text" name="company"><br>
		<input type="submit" value="등록하기" >
		</div>
	</form>
	<%
		response.sendRedirect("CarMenu2.jsp");
	
	%>
</body>
</html>