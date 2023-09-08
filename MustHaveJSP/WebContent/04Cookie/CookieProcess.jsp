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
		//form 에서 보낸 name값 id ,pw 받아오기
		// 폼에서 받아온 아이디값이 abcd고 비밀번호가 1234 의 두조건을 만족할때
		// 새로운 쿠기값을 생성해 userId 의 abcd를 userpw의 1234의 해당하는 값을
		// 저장하고 reponse.addCooke로 id값과 pw를 보낸다.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id.equals("abcd") && pw.equals("1234")){
			Cookie cookie_id = new Cookie("userid","abcd");
			Cookie cookie_pw = new Cookie("userpw","1234");
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			response.sendRedirect("CookieResult2.jsp");
		}else{
			response.sendRedirect("CookieCut.jsp");
		}
	
	%>
</body>
</html>