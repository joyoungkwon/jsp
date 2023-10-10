<%@page import="java.util.List"%>
<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String grade = request.getParameter("grade");
	
	
		StudentDAO dao = new StudentDAO();
		List<StudentDTO> sList = dao.selectAvg(grade);
		dao.close();

	%>
	<form>
	<table border="1">
		<tr>
			<th>
			학점 :<input type="text" name="grade">
				<input type="submit" value="찾기">
			</th>
		</tr>
	</table>
	
	</form>
	<table border="1">
			
		<tr>
			<th>학번</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>학점</th>
		</tr>
		
		<c:if test='${empty param.grade}'>
			<% for(StudentDTO dto2 : sList) {%>
				<tr>
					<th><%=dto2.getStudentId() %></th>
					<th><%=dto2.getKor() %></th>
					<th><%=dto2.getEng() %></th>
					<th><%=dto2.getMat() %></th>
					<th>
						<c:set var="avg" value='<%=dto2.avg()%>'></c:set>
						<c:choose>
							<c:when test="${avg>=90}">A</c:when>
							<c:when test="${avg>=80}">B</c:when>
							<c:when test="${avg>=70}">C</c:when>
							<c:otherwise>F</c:otherwise>
						</c:choose>
					</th>
				</tr>
			<% } %>
		</c:if>
		
		<c:if test="${not empty param.grade}">
			<%for(StudentDTO dto : sList) { %>
			
			<tr>
				<th><%=dto.getStudentId() %></th>
				<th><%=dto.getKor()%></th>
				<th><%=dto.getEng()%></th>
				<th><%=dto.getMat()%></th>
				<th><%=dto.getGrade()%></th>
			</tr>
			<%} %>
		</c:if>
		
	</table>


</body>
</html>