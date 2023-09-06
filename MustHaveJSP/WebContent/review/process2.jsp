<!-- 지시어 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 스트릿틀립 -->
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("jsp")){
			if(pw.equals("1234")){
				out.print("환영합니다.");
			}else{
				out.print("비밀번호가 틀립니다.");
			}
		}else{
			out.print("아이디가 틀립니다 사용할수 없는 아이디입니다.");
		}
		
	%>

	<p>
		<!-- 표현식 -->
	</p>
</body>
</html>