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
		// 요청하다 request set(뭔가를 새팅함 charaterEncoding 직역하면 글자 세팅 이라는 뜻)
		// UTF-8 은 한글 해석하면 언어를 세팅 하는 값을 한글로 요청하는 구문
		request.setCharacterEncoding("UTF-8");
		// requset.jsp 에서 post 메소드 방식으로 보낸 name 값을 requset로 요청 하여 
		// String 타입 name이라는 변수에 저장함.
		String name = request.getParameter("name");
	%>

	<p>
		<!-- 표현식 -->
		당신의 이름은 ? : <%=name%>
	</p>
</body>
</html>