<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#a a {
	text-decoration: none;
	color: black;
}

#a {
	color: red;
}
</style>
</head>
<body>
	<h2>파일 첨부형 비회원제 게시판</h2>
	
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> 
				<input type="text" name="searchWord" />
				<input type="submit"value="검색하기" />
				</td>
			</tr>
		</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="15%">첨부파일</th>
		</tr>
		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<th colspan="6" align="center">
						등록된게시물이 없습니다
					</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${boardList}" var="row" varStatus="loop">
					<tr align="center">
						<td>
							${map.totalCount -(((map.pageNum-1)*map.pageSize)+loop.index)}
						</td>
						<td align="left">
							<a href="../mvcboard/view.do?idx=${row.idx}">${row.title}</a>
						</td>
						<td>${row.name}</td>
						<td>${row.visitcount}</td>
						<td>${row.postdate}</td>
						<td>
							<c:if test="${not empty row.ofile}">
								<a href="../mvcboard/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}">[다운로드]</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<table border="1" width="90%">
		<tr align="center">
			<td id="a">
				${map.pagingImg}
			</td>
			<td width="100"><button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button></td>
		</tr>
	</table>

</body>
</html>