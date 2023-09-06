<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %> 
<%
	// pageContext.set으로 설정
	// 좌측부터 변수 이름 오른쪽은 변수의 value값 설정
	pageContext.setAttribute("pageIntegers", 1000);
	pageContext.setAttribute("pageString","페이지 영역의 문자열");
	pageContext.setAttribute("pagePerson", new Person("조영권",24));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지 영역의 속성값 읽기</h2>
	<%
		// Object 타입이라 캐스팅이 필요함 
		// pageContext.setAttribute 으로 설정한 값을 pageContext.getAttribute으로 받아오기
		int pinteger = (Integer)(pageContext.getAttribute("pageIntegers"));
		String pString = (String)(pageContext.getAttribute("pageString").toString());
		// Person 타입으로 캐스팅 한 pagePerson의 get메소드를 이용해 나이를 뽑아올떄 자동 언박싱 되어 나와서
		// 다시 언박싱 할필요가 없음.
		Person nPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	<h1><%=pinteger %></h1>
	<h1><%=pString %></h1>
	<h1><%=nPerson.getName() %></h1>
	
	<h2>include된 파일에서 page 영역 읽어오기</h2>
	<%@ include file="PageInclude.jsp" %>
	
	<h2>페이지 이동후 page영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp바로가기</a>
</body>
</html>