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
		int num1 =3;
		pageContext.setAttribute("num2", 4);
		pageContext.setAttribute("num3", "5");
		pageContext.setAttribute("num4", 8);
		pageContext.setAttribute("num5", "가나다");
		pageContext.setAttribute("num6", null);
		pageContext.setAttribute("a", "가나다");
		pageContext.setAttribute("b", "가나다");
				
	%>
</body>
	<h3>변수할당 및 출력</h3>
	<p>${num2}</p>
	<p><%=num1%></p>
	<p>${num2+num2}</p>
	<p>${num2+num3}</p>
	<p>${num4=10}</p>
	
	<h3>비교연산자</h3>
	<p>${num2 gt num4}</p>
	<p>${a eq b}</p>
	
	
	<h3>null연산</h3>
	<p>${num2+num6}</p>
</html>