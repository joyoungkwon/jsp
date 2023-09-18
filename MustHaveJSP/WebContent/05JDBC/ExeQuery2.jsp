<%@page import="common.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 정보 출력</h2>
	<%
		JDBConnect3 jdbc = new JDBConnect3();
		String sql = "select * from memberuser";
		
		jdbc.stmt = jdbc.con.createStatement();
		
		jdbc.rs= jdbc.stmt.executeQuery(sql);
		
		
		while(jdbc.rs.next()){
			String id = jdbc.rs.getString(1);
			String pw = jdbc.rs.getString(2);
			String name = jdbc.rs.getString(3);
			
			out.print(id+" "+pw+" "+name+" "+"<br>");
		}
		jdbc.close();
	%>
</body>
</html>