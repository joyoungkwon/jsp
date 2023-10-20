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
	<c:import url="menu.jsp"/>
	<c:if test="${not empty param.error}">
		<p>로그인 실패</p>
	</c:if>
	<h1>로그인</h1>
	<form action="login.do" method="post">
	
		아이디<input type="text" name="id"> 
		비밀번호<input type="text" name="pw"> 
		
		<input type="submit" value="전송하기">
	</form>

</body>
</html>