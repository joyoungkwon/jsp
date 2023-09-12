<%@page import="common.JDBConnect2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JDBC테스트</h2>
	<%
		// jdbc 자바 파일 생성자의 url, id , pwd 에 만들어놓은 con으로 연동한 생성자 호출
		// 자동연결
		JDBConnect2 jdbc1 = new JDBConnect2();
		// 자원해제 close메서드 
		jdbc1.close();
	
	%>
</body>
</html>