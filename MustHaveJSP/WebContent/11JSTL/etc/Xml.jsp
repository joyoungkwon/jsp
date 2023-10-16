<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--c:import로 url을 끌어옴 Inc 폴더의 내가 설정한 xml파일 그안에는 booklist라는 세팅값이 있음 
		그걸 끌어온걸 booklist 변수로 저장시킴 x:parse를 이용해서저장 ${el태그}로 다시 blist로 강제 캐스팅한효과
		x:out 을 이용해서 select(검색함)
	--%>
	<c:import url="../Inc/BookList.xml" var="booklist" charEncoding="utf-8"/>
	<x:parse xml="${booklist}" var="blist"/>
	
	<h1>파싱1</h1>
	제목:<x:out select="$blist/booklist/book[1]/name"/><br>
	저자:<x:out select="$blist/booklist/book[1]/author"/><br>
	가격:<x:out select="$blist/booklist/book[1]/price"/><br>
	
	<h1>파싱2</h1>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
			<th>가격분류</th>
		</tr>
		<x:forEach select="$blist/booklist/book" var="item">
			<tr>
				<th><x:out select="$item/name"/></th>
				<th><x:out select="$item/author"/></th>
				<th><x:out select="$item/price"/></th>
				<th>
				<x:choose>
					<x:when select="$item/price>=20000">
						고가서적
					</x:when>
					<x:otherwise>
						저가서적
					</x:otherwise>
				</x:choose>
				</th>
			</tr>
		</x:forEach>
	</table>
	
</body>
</html>