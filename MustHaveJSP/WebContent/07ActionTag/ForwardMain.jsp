<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--페이지영역으로 pattr설정 리퀘스트영역으로 rAttr설정 --%>
<%
	pageContext.setAttribute("pAttr", "김유신");
	request.setAttribute("rAttr", "계백");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>액션태그를 이용한 포워딩</h2>
	<jsp:forward page="/07ActionTag/ForwardSub.jsp"></jsp:forward>
</body>
</html>