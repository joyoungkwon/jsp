<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String outerpath1 ="inc/Outerpage1.jsp";
	String outerpath2 ="inc/Outerpage2.jsp";
	String outerpath3 ="inc/Outerpage3.jsp";
	
	
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
	

%>
<%-- jsp 액션 태그는 무조건 끝에태그를/로 닫고
	변수와 페이지 영역을 못끌어옴 request는 가능 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--include 파일은 모든 페이지든 리퀘스트 영역이든 끌어올수 있음
		jsp 액션 태그는 리퀘스트 영역만 끌어옴 --%>
	<h2> 지시어로 페이지 포함</h2>
	<%@ include file="inc/OuterPage1.jsp" %>
	<p>외부 파일의 선언된 변수 불러오기 <%=newVar1 %></p>
	<h2> 지시어로 페이지 포함</h2>
	<jsp:include page="inc/OuterPage2.jsp"/>
	
</body>
</html>