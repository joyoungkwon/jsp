<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List boardlist = (List) request.getAttribute("boardlist");
// 스트링 경우에 integerparseInt 하면 되지만 넘어오는 값이 오브젝트 이기때문에 오브젝트 안에 intvalue값을 뽑아와야함
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

</head>
<body>

	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form action='<c:url value="./BoardListAction.do"/>' method="post">
			<div class="text-right">
				<span class="badge badge-success">전체${total_record}건</span>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-striped" border="1">

					<tr align="center">
						<td>번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>제목</td>
						<td>내용</td>
						<td>날짜</td>
						<td>방문자수</td>
						<td>IP</td>
					</tr>
					<c:set var="list" value="${boardlist}" />
					<c:forEach var="boardlist" items="${list}">
						<tr align="center">
							<th>${boardlist.num}</th>
							<th>${boardlist.id}</th>
							<th>${boardlist.name}</th>
							<th><a
								href="./BoardViewAction.do?num=${boardlist.num}&pageNum=${pageNum}">${boardlist.subject}</a></th>
							<th>${boardlist.content}</th>
							<th>${boardlist.regist_day}</th>
							<th>${boardlist.hit}</th>
							<th>${boardlist.ip}</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</form>
	</div>
</body>
</html>










