<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- 선언부 -->
<%!
	public int sum(){
		int result = 0;
		for(int i =1 ; i<=100; i++){
			result += i;
		}
		return result ;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 스트립틀릿에 함수호출 가능 -->
<%
 int a = sum();
%>
<!-- 표현식 (%=) -->
	1부터 100까지의 합 :<%= a %>
	
	
	1부터 100까지의 합2:<%= sum() %>
</body>
</html>