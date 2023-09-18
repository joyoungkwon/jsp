<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--Jsp:useBean 으로 id하나 설정 class는 common의person 영역은 request
	setpropery로 이름과 변수와 value로 값설정 name="person"으로 통힘(자바빈즈 이름)
	스코프 지우면 기본이 page영역
 --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>UseBean 액션태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<jsp:useBean id="pseron" class="common.Person" scope="request"/>
	<jsp:setProperty property="name" value="임꺽정" name="person"/>
	<jsp:setProperty property="age" value="40" name="person"/>
	
	<ul>
		<li>이름:<jsp:getProperty property="name" name="pseron"/></li>
		<li>나이:<jsp:getProperty property="age" name="pseron"/></li>
	</ul>
</body>
</html>