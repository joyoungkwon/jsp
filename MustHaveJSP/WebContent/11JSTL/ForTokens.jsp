<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>향상된 for문 형태의 forEach태그</h4>
	<%
		String rgba ="Red,Green,Blue,Black" ;
	%>
	<h1>토큰 태그 사용 </h1>
	<c:forTokens items="<%=rgba%>" delims="," var="color">
		<span style="color: ${color};">${color}</span><br>
	</c:forTokens>
	
</body>
</html>