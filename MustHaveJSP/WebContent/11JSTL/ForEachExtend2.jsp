<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>리스트 컬렉션 사용하기</h4>
	<%
		LinkedList<Person> lists = new LinkedList<>();
		lists.add(new Person("장영실",34));
		lists.add(new Person("신숙주",50));
		lists.add(new Person("맹사성",54));
	%>
	
	<c:set var="lists" value="<%=lists%>"/>
	<c:forEach var="list" items="${lists}">
		<ul>
			<li>
				이름: ${list.name} 나이: ${list.age} <br>
			</li>
		</ul>
	</c:forEach>
	
	<%
		Map<String,Person> map = new HashMap<>();
		map.put("1st", new Person("장영실",50));
		map.put("2st", new Person("황희",53));
		map.put("3st", new Person("바보",60));
	%>
	
	<c:set var="map" value="<%=map%>"/>
	<c:forEach var="maps" items="${map}">
			key => ${maps.key}
			이름  : ${maps.value.name} , 나이 : ${maps.value.age},
	</c:forEach>
</body>
</html>