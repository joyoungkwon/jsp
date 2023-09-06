<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Scanner"
 %>
 <%!
 int sum = 0;
 int max = 100;
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<%
 	 	for(int i =0; i<= max;i++){
 	 		sum += i;
 	 	}
 	 out.println("합계는 : "+sum);
 	%>
</body>
</html>