<%@page import="common.Car"%>
<%@page import="common.Person"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	
	<c:set var="directVar" value="100"></c:set>
	<c:set var="elVar" value=" ${directVar mod 5} "/>
	<c:set var="expVar" value="<%=new Date()%>"/>
	<c:set var="today" value='<%=new SimpleDateFormat("yyyy년MM월dd일").format(new Date())%>'/>
	
	<h1>JSTL 변수출력</h1>
	<ul>
		<li>directVar : ${directVar}</li>
		<li> elVar : ${elVar} </li>
		<li> expVar : ${expVar} </li>
		<li> 오늘날짜 : ${today} </li>
	</ul>

	<h4>자바빈주 생성 1- 생성자 사용</h4>
	<c:set var="personVar1" value='<%=new Person("박문수",50) %>' scope="request"/>
	
	<ul>
		<li>이름 : ${requestScope.personVar1.name}</li>
		<li>나이 : ${requestScope.personVar1.age}</li>
	</ul>
	
	
	<h4>자바빈주 생성 2- 타겟 프로포티 사용</h4>
	<c:set var="carVal1" value='<%=new Car()%>' scope="request"/>
	<c:set target="${carVal1}" property="carName" value="티코"/>
	<c:set target="${carVal1}" property="carPrice" value="500000"/>
	<c:set target="${carVal1}" property="carColor" value="빨강"/>
	<ul>
		<li>자동차 이름 : ${carVal1.carName}</li>
		<li>자동차 가격 : ${carVal1.carPrice}</li>
		<li>자동차 색상 : ${carVal1.carColor}</li>
	</ul>
	
</body>
</html>