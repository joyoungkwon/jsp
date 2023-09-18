<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Membership.*" %>
<%@ page import="common.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>어플리케이션 영역의 공유</h2>
	<%
		//컬렉션 프레임워크의 맵
		// 키값으로 지정해놓은 값을 불러옴 키값으로 문자와, 숫자를 지정할수 있음
		// String Integer 등 키값을 지정할수 있음 
		
		// 스트링으로 키값지정,Person 객체타입의 value 저장
		Map<String, Person> maps = new HashMap<>();
		// map. put으로 새팅 문자열 actor1로 벨류값 Person 객체를 생성하고
		// 그값으로 이수일과 30을 찾는거 (사물함 생각하면 편할듯)
		maps.put("actor1", new Person("이수일",30));
		maps.put("actor2", new Person("심순애",28));
		
		
		// application 의 setAtteribute 로 Map 을 "maps" 키값으로  maps의 벨류값을 어플리케이션 영역의 저장함
		// iterator
		application.setAttribute("maps", maps);
	
	%>
	어플리케이션 영역의 저장되었습니다.
</html>