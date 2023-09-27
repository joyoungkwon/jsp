<%@page import="java.util.List"%>
<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
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
		String name = request.getParameter("name");
		StudentDAO dao = new StudentDAO();
		List<StudentDTO> list = dao.studentlistall();
		
		StudentDTO dto = dao.selectStudentDTO(name);
	%>
	<form>
	이름:<input type="text" name="name">
		<input type="submit" value="검색"> 
	</form>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>학번</td>
			<td>성별</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>학점</td>
		</tr>
		<%if(name!=null) {%>
		
		<tr>
			<td></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getStudentId() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getKor() %></td>
			<td><%=dto.getEng() %></td>
			<td><%=dto.getMat() %></td>
			<td><%=dto.point() %></td>
		</tr>
		
		
		<%
		}else{	
			for(StudentDTO dto2 : list){
		
		%>
		
		<tr>
			<td></td>
			<td><%=dto2.getName()%></td>
			<td><%=dto2.getStudentId() %></td>
			<td><%=dto2.getGender() %></td>
			<td><%=dto2.getKor() %></td>
			<td><%=dto2.getEng() %></td>
			<td><%=dto2.getMat() %></td>
			<td><%=dto2.point() %></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	
</body>
</html>