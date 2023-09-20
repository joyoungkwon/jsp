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
	  String id = (String)session.getAttribute("userId");
	  String pw = (String)session.getAttribute("userPw");
	  
	  out.print(id);
	  out.print(pw);
	  
	  if(id==null && pw==null){
		  out.print("<p><a href='login.jsp'>로그인</a></p>");
		  out.print("<p><a href='addMember.jsp'>회원가입</a></p>");
	  }else{
		  out.print("<p><a href='logout.jsp'>로그아웃</a></p> ");
	  }
	%>
 	
</body>
</html>