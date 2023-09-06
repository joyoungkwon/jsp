<%@page import="java.util.Scanner"%>
<%@page import="org.apache.coyote.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	 int num = Integer.parseInt(request.getParameter("num"));
	 int sum = 0;
	 int num2 = Integer.parseInt(request.getParameter("num2"));
	 
		for(int i =num; i<=num2; i++){
		sum+=i;
	
	}
	%>
	<h1> 시작숫자는 <%= num  %></h1>
	 <%=num %>부터 <%=num2 %> 합계는<%= sum %>
</body>
</html>