<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ include file = "page.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// include
// 시계 출력 4시 10분 3초 -> 


// response 내장 객체
// setIntHeader
 response.setIntHeader("Refresh", 1);
 out.println("<br>");
 String nowTime2 = hour+":"+mi+":"+se;
 out.println("접속한 현재 시간은"+nowTime2);

%>
</body>
</html>