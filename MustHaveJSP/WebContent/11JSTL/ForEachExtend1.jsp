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
		String[]rgbs ={"Red","Green","Blue","Black"};
	%>
	<c:forEach items="<%=rgbs%>" var="c">
		<span style="color:${c};">${c}</span>
	</c:forEach>
	
	
	<h1>varStatus 의 속성 보기</h1>
	
	<c:forEach items="<%=rgbs%>" var="c" varStatus="rgbsItem">
		<span>${rgbsItem.count}</span>
		<span>${rgbsItem.index}</span><br>
	</c:forEach>
</body>
</html>