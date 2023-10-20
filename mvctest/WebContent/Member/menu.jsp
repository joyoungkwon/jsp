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
	<c:set var="id" value="${dto.id}"/>
	<c:choose>
		<c:when test="${not empty id}">
			<a href="logout.do">로그아웃</a>
			<a href="#">회원탈퇴</a>
		</c:when>
		<c:otherwise>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
		</c:otherwise>
	</c:choose>
</body>
</html>