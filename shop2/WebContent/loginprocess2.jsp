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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
	
	%>
	<p>${message}</p>
	<a href="./LoginCheck.mvc?id=<%=id%>&pw=<%=password%>">아이디 비번 맞는지 확인하기</a>
	&nbsp;&nbsp;&nbsp;
</body>
</html>