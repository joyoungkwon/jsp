<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/index.css" rel="stylesheet" type="text/css">
<link href="./resources/css/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript"src="./resources/js/register.js"></script>
<meta charset="UTF-8">
<title>아이디 중복검색</title>
<script type=""></script>
</head>

<body><script type="text/javascript" src="./resources/js/register.js"></script>
	<h2>아이디 중복 체크</h2>
	<form action="idCheckServlet" method="get" name="idCheckFrom">
		<label>아이디</label>
		<input type="text" name="id" value="${userId}">
		<button type="submit">중복체크</button>
		<br>
		<c:set var="result" value="${result}"/>
		<c:choose>
			<c:when test="${result eq 0 }">
				${userId}아이디 는 사용 가능
				<button type="submit" onclick="idOk()">간지작살나게사용하기</button>
			</c:when>
			<c:otherwise>
				${userId}아이디 사용 불가
			</c:otherwise>
		</c:choose>
	</form>
</body>
</html>