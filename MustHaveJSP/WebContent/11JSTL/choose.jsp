<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="scopeVar" value="page Value"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="number" value="100"/>
	<h1>choose 태그로 홀수 짝수 출력하기</h1>
	<c:choose>
		<c:when test="${number % 2 eq 0}">${number}는 짝수입니다.</c:when>
		<c:otherwise>${number} 는 홀수입니다.</c:otherwise>
	</c:choose>
</body>
</html>