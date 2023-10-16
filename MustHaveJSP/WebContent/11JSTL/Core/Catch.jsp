<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>JSTL 에서 예외 처리</h4>
	<%
		int num1 = 1;
	%>
	<c:catch var="eMessage">
	<%
		int result =num1/0;
	%>
	</c:catch>
	<h3>예외 내용 출력하기</h3>
	<p>${eMessage}<p>
	<fmt:formatNumber></fmt:formatNumber>
</body>
</html>