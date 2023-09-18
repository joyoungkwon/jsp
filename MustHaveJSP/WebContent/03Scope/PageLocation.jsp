<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Membership.*" %>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이동후 page 영역의 속성값 읽기</h2>
	<%
		Object pInteger = pageContext.getAttribute("pageInteger");
	
	
	
	%>
	<ul>
		<!-- 3항 연산자  (pInteger==null)이면 ?(값을 주겠다) "값없음."을 :pInteger 의 값없음을 저장-->
		<li>Integer 객체 : <%=(pInteger==null) ?"값없음": pInteger %></li>
		<li></li>
		<li></li>
	
	</ul>
</body>
</html>