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
		String user_id = session.getAttribute("user_id").toString();
		
		String num = request.getParameter("num");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
	%>

</body>
</html>