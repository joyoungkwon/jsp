<%@page import="common.JDBConnect"%>
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
		JDBConnect j = new JDBConnect();
	
		request.setCharacterEncoding("utf-8");
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		
		String query = "insert into member (id,pw,name,phone,address) values(?,?,?,?,?)";
		
		try{
			j.psmt = j.con.prepareStatement(query);
			j.psmt.setString(1, id);
			j.psmt.setString(2, pw);
			j.psmt.setString(3, name);
			j.psmt.setString(4, phone);
			j.psmt.setString(5, address);
			
			j.psmt.executeUpdate();
			
			out.print("데이터추가성공기기기모찌");
		}catch(Exception e){
			
			out.print("테이블 추가 실패"+e.getMessage());
		}finally{
			
			j.close();
		}
		
	%>
</body>
</html>