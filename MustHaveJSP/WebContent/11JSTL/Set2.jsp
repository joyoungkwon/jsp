
<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리스트 컬렉션 이용하기</h1>
	<%
		Map<String,Person> pMap = new HashMap<>();
		pMap.put("personArgs1", new Person ("하위지",65));
		pMap.put("personArgs2", new Person ("이개",67));
		
		
		ArrayList<Person> alist = new ArrayList<>();
		alist.add(new Person("조영권",24));
		alist.add(new Person("김예린",24));
	%>
	
	<c:set var="personList" value="<%=alist%>" scope="request"/>
	<ul>
		<li>이름 : ${personList[0].name}</li>
		<li>이름 : ${personList[0].age}</li>
	</ul>
	
	<c:set var="personMap" value="<%=pMap%>" scope="request"/>
	<ul>
		<li>이름 : ${personMap.personArgs1.name}</li>
		<li>나이 : ${personMap.personArgs1.age}</li>
		<li>이름 : ${personMap.personArgs2.name}</li>
		<li>나이 : ${personMap.personArgs2.age}</li>
	</ul>
	
	
</body>
</html>