<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage ="true"
    %>
    <!-- 선언부 -->
    <%! String a= "바보"; %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>에러가 발생했습니다.</h1>
	<!-- 스크립 틀립 -->
	<!-- % = 해당값 대입할떄 , html 태그의 변수 대입할때 느낌  -->
	<p>오류명 :  <%= exception.getClass().getName()	%></p>
	<h2>나는 :  <%= a	%></h2>
</body>
</html>