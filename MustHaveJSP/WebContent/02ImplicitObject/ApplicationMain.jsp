<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml 에 설정한 내용 읽어오기</h2>
	<!-- web.xml에 설정한 PARAM값 가져오기  -->
	<!-- 가져올떄는 어플리케이션.의 getInitParameter 로 끌어옴(설정한 변수이름) 서치 , VALUSE값 가져옴 -->
	초기화 매개변수:<%=application.getInitParameter("INIT_PARAM") %>
</body>
</html>