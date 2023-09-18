<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- 주석 안먹힘 액션태그 설명
 jsp 액션태그 useBean 설정 id값은 useBean의 별명 같은거, class는 끌어올 자바파일 scope는 영역설정
 jsp 액션태그 useBean의 setProperty로 값을 세팅. 태그안의property=는변수 이름 과 같은 느낌,셋 안에 name은 위에 설정한 useBean의 별명 값설정
  value로 값세팅
  forward = 넘길페이지 ?뒤에변수=그리고값.(하나일때)
  <여러개일때 jsp param으로 묶어서넘김 표현식가능>
 --%>
<body>
	<%
		String value ="방랑시인";
	
	%>
	
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	<jsp:setProperty property="name" name="person" value="김삿갓"/>
	<jsp:setProperty property="age" name="person" value="56"/>
		<jsp:forward page="ParamForward.jsp?param1=김병연">
			<jsp:param value="경기도양주" name="param2"/>
			<jsp:param value="<%=value %>" name="param3"/>
		</jsp:forward>
</body>
</html>