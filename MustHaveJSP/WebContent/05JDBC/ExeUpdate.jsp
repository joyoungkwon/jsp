<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트 </h2>
	<%
		// jdbc 임포트 후 연결.
		JDBConnect jdbc = new JDBConnect();
		// 사용자 추가
		String id = "test1";
		String pass = "1111";
		String name = "테스트1회원";
		//sql구문에서 기본필드값 다 입력시 생략가능.
		// 사용자의정의에 따라 변하는 동적 쿼리문 
		
		String sql = "insert into member(id,pass,name) values(?,?,?)";
		// 동적 쿼리문 PreparedStatement 
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pass);
		psmt.setString(3, name);
		
		// PreparedStatement.executeUpdate
		// update의 실행결과 = 몇줄이바뀐지 줄의개수를 리턴함
		// int타입으로 리턴하기때문에 받기도 int
		int inResult = psmt.executeUpdate();
		
		out.print(inResult +"행이 추가 되었습니다.");
		
		jdbc.close();
	
	%>
</body>
</html>