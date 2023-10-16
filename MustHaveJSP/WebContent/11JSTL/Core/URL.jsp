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
	<h1>URL 태그로 링크 걸기</h1>
	<c:url value="/11JSTL/Inc/OhterPage.jsp" var="url">
		<c:param name="user_param1" value="조"/>
		<c:param name="user_param2" value="냥권"/>
	</c:url>
	<a href="${url}">다른페이지 연결하기</a>
</body>
</html>