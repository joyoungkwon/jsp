<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date date = new Date();
%>
	<%-- <c:set var="today" value="<%=date%>"/> --%>
	<c:set var="today" value="<%=new java.util.Date() %>"/>
	<h4> 날짜 포멧 </h4>
	full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br>
	long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/><br>
	default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/><br>
	<h4>시간포멧</h4>
	full : <fmt:formatDate value="${today}" type="time" timeStyle="full"/><br>
	default : <fmt:formatDate value="${today}" type="time" timeStyle="default"/><br>
	
	<h4>시간과 날짜를 한번에 포멧하기</h4>
	<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/><br>
	
	<h4>타임존 생성</h4>
	<fmt:timeZone value="Japan">
		타임존 full :  <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="japan">
		<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	</fmt:timeZone>
	
	<h4> 로케일 설정</h4>
	
	<fmt:setLocale value="Ja_JP"/>
	<fmt:formatNumber value="99999" type="currency"/>
	
	
	
	
</body>
</html>