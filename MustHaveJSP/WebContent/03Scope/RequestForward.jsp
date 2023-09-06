<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		out.print(request.getParameter("name"));
		
		
		Person nPerson = (Person)(request.getAttribute("requestPerosn"));
		request.getRequestDispatcher("RequestForward.jsp2?name="+nPerson.getName()).forward(request, response);
	%>
</body>
</html>