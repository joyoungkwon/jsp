<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--int 타입으로 foward한 변수값을 강제캐스팅 해서 int타입만 표현식으로 뿌려줌
	CarMain2에서, jsp:setProperty (세팅값을 이용한) use변수와 값설정은
	getProperty를 써서 끌어오고, 파람으로 CarPrice는 forward할때 보내는 CarProcess2.jsp?CarPrice=100250
	이런식으로 보낸것도 request.getParmeter를 써서 끌어옴.scope가 request영역이라그런듯
	이렇게 강제캐스팅 필요할떄 (필요시 스트립틀립 위에써서 가져와서 캐스팅후 표현식으로 표현도가능)
 --%>
<%

	int CarPrice = Integer.parseInt(request.getParameter("CarPrice"));
	int MaxSpeed = Integer.parseInt(request.getParameter("MaxSpeed"));

%>
<body>
	<jsp:useBean id="car" class="common.Car" scope="request"></jsp:useBean>
	<ul>
		<li>자동차이름:<jsp:getProperty property="carName" name="car"/></li>
		<li>자동차가격:<%=CarPrice%></li>
		<li>자동차색깔:<%=request.getParameter("CarColor") %></li>
		<li>자동차회사:<%=request.getParameter("Carcompany") %></li>
		<li>자동차최고속도:<%=MaxSpeed%></li>
	</ul>
	
</body>
</html>