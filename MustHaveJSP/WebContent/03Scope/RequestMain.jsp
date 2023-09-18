<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Membership.*" %>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("requestInteger", 8282);
		request.setAttribute("requestString","request 영역의 문자열" );
		request.setAttribute("requestPerosn", new Person("안중근",31));
		
	
	%>
</body>
	<h2>리퀘스트 영역에 설정된 값 읽기</h2>
	<%
		int num1 = (Integer)(request.getAttribute("requestInteger"));
		// 캐스팅 해도되고
		//String str = (String)(request.getAttribute("requestString"));
		Person nPerson = (Person)(request.getAttribute("requestPerosn"));
		request.getRequestDispatcher("RequestForward.jsp?name="+nPerson.getName()).forward(request, response);
	%>
	
	<ul>
		<li>Integer 객체 : <%=num1 %></li>
		<!-- 캐스팅 안해도됌 -->
		<li>String객체 : <%=request.getAttribute("requestString") %></li>
		
	</ul>
</html>