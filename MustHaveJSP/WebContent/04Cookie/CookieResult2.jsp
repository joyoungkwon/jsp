<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>내가만든 쿠키 너를 위해서 구웠지</h1>
	<% 
		Cookie [] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie c : cookies){
				String id = c.getName();
				String pw = c.getName();
				out.print(id+"\t"+pw+"<br>");
			
	%>
		<h2>쿠키의 아이디는 <%=id%></h2>
		<h2>쿠키의 비밀번호<%=pw %> </h2>
	<%
			}
		}
	%>
</body>
</html>