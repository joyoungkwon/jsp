<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("personObj", new Person("홍길동",33));
		request.setAttribute("stringObj", "히힛 안녕 내이름은 남대문 열려있죠");
		request.setAttribute("integerObj" , new Integer (99));
		
	
	%>
	<jsp:forward page="ObjectResult.jsp">
		<jsp:param value="10" name="fristNum"/>
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>
</body>
</html>