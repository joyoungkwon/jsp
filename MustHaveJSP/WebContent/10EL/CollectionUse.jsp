<%@page import="common.Car"%>
<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		List<Object> aList = new ArrayList<>();
		aList.add("청해진");
		aList.add(new Person("장보고",28));
		aList.add(new Car("자동창",230000,"블랙"));
		
		pageContext.setAttribute("pageList", aList);
	%>
	
	<h2>리스트컬렉션 EL결과</h2>
	<ul>
		<li>aList의 0번째요소 : ${pageList[0]}</li>
		<li>aList의 1번째요소 : ${pageList[1].name},${pageList[1].age}</li>
	</ul>
	<ul>
		<li>자동차 요소${pageList[2].carName},${pageList[2].carPrice},${pageList[2].carColor}</li>
	</ul>
	
	<%
		Map<String,String> map = new HashMap<>();
	 	map.put("한글","훈민정음");
	 	map.put("Eng", "English");
		pageContext.setAttribute("pageMap", map);
		
	%>
	
	<h2>맵 컬렉션 EL결과</h2>
	<ul>
		<li>영문 : ${pageMap["Eng"]},${pageMap['Eng']},${pageMap.Eng}</li>
		<li>한글 : ${pageMap["한글"]},${pageMap['한글']}, \${pageMap.한글}</li>
	</ul>
	
</body>
</html>