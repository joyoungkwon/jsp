<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
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
Date now = new Date();

int hour = now.getHours();
int mi = now.getMinutes();
int se = now.getSeconds();
SimpleDateFormat simple = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
String nowTime = simple.format(now); 
%>

</body>
</html>