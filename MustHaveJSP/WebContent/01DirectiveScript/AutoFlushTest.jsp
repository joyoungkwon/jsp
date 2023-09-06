
<!-- 지시어 
기본 8 kb buffer - 일정 데이터를 저장하고 일정한 값을 넘으면 보내는 식
buffer의 autoFlsh - 일정한 값 데이터 쌓일시 자동으로 비우는 식 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    buffer ="1kb"
    autoFlush="false"
    %>
    <!-- (변수)선언부 -->
    <%!  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 스크립틀립 -->
	<%
	 for(int i =1; i<=100; i++){
		 out.println("ab");
	 }
	%>

</body>
</html>