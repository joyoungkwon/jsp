<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Membership.*" %>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>어플리케이션의 속성 영역값 읽기.</h2>
	<%
		Map<String,Person> maps = (Map<String,Person>)application.getAttribute("maps");
		Set<String> keys = maps.keySet();
		
		for(String key : keys){
			// keys 의 maps의 저장되어있는 키값을 모두 리턴 하여 저장한다음
			// 저장되어 있는 키값을 get으로 받아온다 (key) 값을
			// 처음의 Map으로 설정한 pereson객체 의 벨류값을 받을려고 person으로 객체를 생성하고 저장한다
			Person person = maps.get(key);
			out.print(person.getName()+":"+person.getAge()+"</br>");
		}
	
	%>
</body>
</html>