<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이트 타입 출력형식 바꾸기 simpledateformat
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH-mm:ss");
	// creationTime 에 세션이생성된 시간을 끌어옴
	long creationTime =session.getCreationTime();
	String creationTimestr =dateFormat.format(new Date(creationTime));
	
	long lastTime = session.getLastAccessedTime();
	String lastTimestr = dateFormat.format(new Date(lastTime));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션설정확인</h2>
	<ul>
		<%-- session.getMaxInactiveInterval()유지시간 web.xml 에서 20분으로 설정한거--%>
		<li>세션 유지 시간:<%= session.getMaxInactiveInterval() %> </li>
		<%--세션의 아이디값을 받아온거 --%>
		<li>세션 아이디:<%= session.getId() %> </li>
		<%--creationTime =session.getCreationTime();세션의 맨처음 접속한 시간을 getCreationTime()으로 호출후
		creationTime에 대입한걸 문자열 데이트포멧 이용해서 날짜 출력형식을 바꾼걸 creationTimestr에 대입한걸 표현식으로대입 --%>
		<li>요청시간:<%= creationTimestr %></li>
		<%--마지막 으로한거 대입. 나노초 단위여서 long 으로 받기. --%>
		<li>마지막요청시간:<%= lastTimestr %> </li>
	</ul>
</body>
</html>