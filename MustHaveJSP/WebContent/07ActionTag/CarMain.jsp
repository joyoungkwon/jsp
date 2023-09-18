<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%
	String carname = request.getParameter("carname");
	int carprice = Integer.parseInt(request.getParameter("carprice"));
	String carcolor = request.getParameter("carcolor");
%>
</head>
<body>
	<jsp:useBean id="car" class="common.Car" scope="request"/>
	<jsp:setProperty property="carName" value="<%=carname%>" name="car"/>
	<jsp:setProperty property="carPrice" value="<%=carprice%>" name="car"/>
	<jsp:setProperty property="carColor" value="<%=carcolor%>" name="car"/>
	
	<ul>
	<li>자동차 이름 :<jsp:getProperty property="carName" name="car"/></li>
	<li>자동차 가격 :<jsp:getProperty property="carPrice" name="car"/></li>
	<li>자동차 색깔 :<jsp:getProperty property="carColor" name="car"/></li>
	</ul>
	
</body>
</html>