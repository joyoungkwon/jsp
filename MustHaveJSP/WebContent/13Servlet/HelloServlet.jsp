<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> web.xml에서 매핑후 jsp에서 출력하기</h2>
	<P>
		<strong><%=request.getAttribute("message") %></strong>
		<br>
		<a href="./HelloServlet.do">바로가기</a>
	</P>
	
</body>
</html>