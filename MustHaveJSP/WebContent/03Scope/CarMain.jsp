<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--자바 파일 임포트 --%>
<%@ page import="java.util.*" %>
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
		// carmain에 2개설정 어플리케이션의 셋 어틀리튜벨트 로
		// 맵으로 이용하고 키 값은 숫자로 하고 벨류값은 car로 설정.
		// CarResult  에서 자동차 이름 가격만 출력.
		
		// 컬렉션 프레임 워크에 인티져의 키값으로 car라는 클래스 를 전체로 받은 벨류값을 호출 함
		
		Map<Integer,Car> maps = new HashMap<>();
		// 해쉬맵의 maps이라는 변수에 put 이라는 메서드를 이용해서 새로운  car 객체의 각각의
		// 지정해놓은 생성자를 통해 값을 넘겨주고 리턴 함
		
		maps.put(1, new Car("페라리",23000,"블루"));
		maps.put(2, new Car("람보르기니",13000,"흰색"));
		// 설정한값을 어플리케이션 영역의 setAttrribute의 "Car 라는 변수의"  maps벨류 값을 저장함.
		application.setAttribute("Car", maps);
		
	
	%>
</body>
</html>