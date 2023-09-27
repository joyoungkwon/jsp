<%@page import="java.util.List"%>
<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String searchFiled = request.getParameter("searchFiled");
	String searchhWord = request.getParameter("searchhWord");
	
	Map<String,Object> map = new HashMap<>();
	
	if(searchFiled!=null){
		map.put("searchFiled", searchFiled);
		map.put("searchhWord", searchhWord);
	}
	StudentDAO dao = new StudentDAO();
	
	List<StudentDTO> list = dao.selectstudent(map);
	
	out.print(searchFiled);

%>
</head>
<body>
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select id="searchField">
						<option value="이름">이름</option>
						<option value="학번">학번</option>
					</select>
					<input type="text" name="searchhWord"/>
					<input type="submit" value="검색하기"/>
				</td>
			</tr>
		</table>
	</form>
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td>학번</td>
			<td>성별</td>
		</tr>
		<%
			for(StudentDTO dto2 : list){
				
		
		%>
		<tr>
			<td><%=dto2.getName() %></td>
			<td><%=dto2.getStudentId() %></td>
			<td><%=dto2.getGender() %></td>
			
		</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>