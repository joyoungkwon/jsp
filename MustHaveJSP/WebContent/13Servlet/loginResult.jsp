<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디비번 출력</h2>
	<p><%=request.getAttribute("id") %></p>
	<p><%=request.getAttribute("pw") %></p>
	
	<a href="./loginResult.do">아이디비번확인하기</a>
</body>
</html>