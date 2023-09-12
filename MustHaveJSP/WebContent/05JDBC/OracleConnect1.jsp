<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
		
		Connection con = null;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "manager";
			String pwd = "1234";
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, pwd);
			out.print("<h1>데이터베이스 연동 성공</h1>");
	
		} catch (Exception e) {
			out.print("데이터베이스연결 실패"+e.getMessage());
		} finally {
			if (con != null)
				con.close();
		}
	%>
</body>
</html>