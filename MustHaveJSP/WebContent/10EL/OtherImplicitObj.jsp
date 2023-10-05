<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//세션 은  로그인유지
		//히힣자동로그인
		CookieManager.makeCookie(response, "ELCookie", "너를위해구었지", 10);
		String cookie = CookieManager.readCookie(request, "ELCookie");
	%>
</body>
	
	<h1>쿠키값 읽기</h1>
		<ul>
		<li>EL쿠키값 : ${cookie.ELCookie.value}</li>
		<li>리드값으로 읽는 쿠키값: <%=cookie%></li>
		</ul>
</html>