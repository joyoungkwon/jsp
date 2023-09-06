<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String greeting = "쇼핑몰 방문을 환영합니다";
	String tagline = "자바 쇼핑몰에 어서오세요";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		//함수 
		// 시간 받아오는 getClock
		function getClock(){
			// 스크립트로 date hour minute second 받아오기
			// ampm 으로 if 값 받을 오전 오후 값.받을꺼
			var date = new Date();
			var hour = date.getHours();
			var minute = date.getMinutes();
			var second = date.getSeconds();
			var ampm;	
			if(hour==12) {
				ampm="오후";
			} else if (hour<12) {
				ampm="오전";
			} else {
				ampm="오후";
				hour = hour - 12;
			}
			var time = ampm + " " + hour + ":" + minute + ":" + second;
			$("#clock").text(time); 
		}
		// 가져오기
		getClock();
		// setInterval 로 주기적으로 업데이트 .
		setInterval(getClock,1000);
		// 1000밀리세컨드 = 1초. 1초마다 getClock = 시간받아옴
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<h3 id="clock"></h3>
		</div>	
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>











