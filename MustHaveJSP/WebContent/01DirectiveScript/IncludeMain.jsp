<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 스트릿틀립 -->
	<%
	out.println("오늘날짜"+today);
	out.println("</br>");
	out.println("내일날짜 "+tomorrow);
	%>
</body>
</html>