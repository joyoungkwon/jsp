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
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script type="text/javascript">
	function checkForm() {
		if(${(user_id==null)}){
			alert("로그인 해주세요");
			return false;
		}
		location.href="./BoardWriteForm.do?id=${user_id}";
	}

</script>
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
				<table class="table table-striped" border="1" >

					<tr align="center" >
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>제목</th>
						<th>내용</th>
						<th>날짜</th>
						<th>방문자수</th>
						<th>IP</th>
					</tr>
					<c:set var="list" value="${boardlist}" />
					<c:forEach var="boardlist" items="${list}">
						<tr align="center">
							<td>${boardlist.num}</td>
							<td>${boardlist.id}</td>
							<td>${boardlist.name}</td>
							<td><a
								href="./BoardViewAction.do?num=${boardlist.num}&pageNum=${pageNum}">${boardlist.subject}</a></td>
							<td>${boardlist.content}</td>
							<td>${boardlist.regist_day}</td>
							<td>${boardlist.hit}</td>
							<td>${boardlist.ip}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="${pageNum}" />
				<c:forEach var="i" begin="1" end="${total_page}">
					<a href="./BoardListAction.do?pageNum=${i}"> <c:choose>
							<c:when test="${pageNum==i}">
								<font color="red"><b>[${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color="blue"><b>[${i}]</b></font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
						<select name="items" class="txt">
							<option value="subject">제목검색</option>
							<option value="content">내용검색</option>
							<option value="name">이름검색</option>
						</select>
						<input name="text" type="text">
						<input type="submit" id="btnAdd" class="btn btn-primary" value="검색">
						</td>
						<td>
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
						</td>
					</tr>
				</table>
			
			</div>
		</form>
	</div>
</body>
</html>










