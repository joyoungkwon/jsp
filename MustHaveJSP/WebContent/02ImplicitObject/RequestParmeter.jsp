<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul{
	list-style: none;
	}
	li{
	font-size: 20px;
	}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8"); //한글처리
	String id = request.getParameter("id"); // 아이디값 파라미터로 받기
	String gender = request.getParameter("gender"); // gender값 파라미터로 받기(name)
	
	
	 // checkbox 의 checked 값이 중복이여서 배열로 처리. 선택된값을 배열로 받아들임
	String[] favo = request.getParameterValues("favo");
	// 공백, 설정 붙어있을시에
	String favoStr="";
	// favo 의 값이 있을때. i번째 방마다 값을 저장.
	if(favo!=null){
		for(int i=0; i<favo.length;i++){
			favoStr += favo[i]+ " ,";
		}
	}
	String intro = request.getParameter("intro").replace("\r\n", "</br>");
	
	%>
	<ul>
	<li>아이디:<%=id%></li>
	<li>성별 :<%=gender %></li>
	<li>관심사항: <%=favoStr %></li>
	<li>자기소개 : <%=intro %></li>
	</ul>
</body>
</html>