<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/layout.css"/>
<link rel="stylesheet" href="./resources/css/index.css"/>
</head>
<body class="center-layout-column">
		<div class="center-layout-column">
			<img class="logo" alt="logo" src="./resources/img/Cyworld.png" />
				<div class="box center-layout-column">
				<p>사용자명 : ${cyMember.id}</p>
				<p>${cyMember.id} 님 가입을 환영합니다.</p>
			<a href="./login.jsp">
				<button type="button">로그인페이지로</button>
			</a>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<button onclick="location.href='./login.jsp';"></button>
</body>
</html>