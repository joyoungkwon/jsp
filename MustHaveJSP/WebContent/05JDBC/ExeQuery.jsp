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
		JDBConnect jdbc = new JDBConnect();
		String sql = "select * from member";
		//자바 파일 jdbc에 저장
		// Statement -정적쿼리문 생성.
		jdbc.stmt = jdbc.con.createStatement();
		// 실행
		jdbc.rs= jdbc.stmt.executeQuery(sql);
		//executeQuery만 rs객체로 받음
		
		while(jdbc.rs.next()){
			String id = jdbc.rs.getString(1);
			String pw = jdbc.rs.getString(2);
			String name = jdbc.rs.getString(3);
			java.sql.Date regidate = jdbc.rs.getDate(4);
			
			out.print(id+" "+pw+" "+name+" "+regidate+"<br>");
		}
		jdbc.close();
	%>
</body>
</html>