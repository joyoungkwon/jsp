    <!-- 지시어 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    String str1 = "jsp";
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>헬로</p>
	<p>
	<%
	out.println(str1 +"입니다.");
	%>
</body>
</html>