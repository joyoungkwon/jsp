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
	<%
		String CarId = request.getParameter("CarId");
		String carName = request.getParameter("carName");
		String color = request.getParameter("color");
		int cost = Integer.parseInt(request.getParameter("cost"));
		
		CarRepository cr = new CarRepository().getinstance();
		Car car = new Car();
		
		car.setCarId(CarId);
		car.setCarName(carName);
		car.setColor(color);
		car.setCost(cost);
		
		cr.CarListadd(car);
		response.sendRedirect("CarMain.jsp");
		
	%>
</body>
</html>