<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* int number = Integer.parseInt(request.getParameter("number")); */
	
		String number2 = request.getParameter("number2");
	%>
	<c:set var="ifnumber" value='<%= request.getParameter("number")%>'/>
	
	<c:if test="${ifnumber mod 3 eq 0}" var="result">
		${ifnumber}는 3의 배수입니다.<br>
	</c:if>
	
	<c:if test="${not result }" var="result2">
		${ifnumber}는 3의 배수가 아닙니다.<br>
	</c:if>
	
</body>
</html>