<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<% if(session.getAttribute("UserId") == null) { %>
					<a href="../06Session/LoginForm.jsp">로그인</a>
				<%}else{ %>
					<a href="../06Session/Logout.jsp">로그아웃</a>
				<%}%>
				&nbsp;&nbsp;&nbsp;
				<a href="#" >게시판페이징x</a>
				&nbsp;&nbsp;&nbsp;
				<a href="#" >게시판페이징</a>
			</td>
		</tr>	
	</table>
</body>
</html>