<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--usebean설정, 셋으로 carname값설정 property앞에는 대문자 사용불가 
	포워드 페이지 프로세스,변수값 250을 담은 CarPrice를 보냄
	jsp forward안에 param3가지변수 생성 각각 CarColor, Carcompany, MaxSpeed,
	포워딩하는 CarProcess2.jsp에서 scope로 설정한 request영역이니깐 getParmeter로 호출 하고
	끌어오는거가능 
--%>
</head>
<body>
	<jsp:useBean id="car" class="common.Car" scope="request"></jsp:useBean>
	
	<jsp:setProperty property="carName" name="car" value="마세라티"/>
	
	<jsp:forward page="CarProcess2.jsp?CarPrice=250">
		<jsp:param value="빨간색" name="CarColor"/>
		<jsp:param value="마세라티" name="Carcompany"/>
		<jsp:param value="100" name="MaxSpeed"/>
	</jsp:forward>
</body>
</html>