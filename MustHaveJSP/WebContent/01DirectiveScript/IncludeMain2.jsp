<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="IncludeFile2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 스트릿틀립 -->
	<%
	
	 int hour = todayTime.getHour();
	 int mit = todayTime.getMinute();
	
	
	out.println(name +"님"+ hour+"시"+mit+"분에 출석하셨습니다.");
	
	SimpleDateFormat simple = new SimpleDateFormat("hh-mm");
	String a = simple.format(todayTime);
	
	out.println(name +"님"+ a +"에 출석하셨습니다.");
	
	
	%>
</body>
</html>