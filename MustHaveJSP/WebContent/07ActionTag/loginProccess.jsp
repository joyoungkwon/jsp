<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	request.setAttribute("rAttr", id);
    	pageContext.setAttribute("pAttr", pw);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--JSP 액션 태그 종류 forward 
	JSP I

--%>
<body>
	<jsp:forward page="loginprocess2.jsp"></jsp:forward>
</body>
</html>