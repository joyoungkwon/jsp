<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간</title>
<!-- 제이쿼리 연동 .. 으로 올라갈 상위폴더 칸 지정 . 하나에 한칸씩 .. 두개면 두칸 올라감 -->
<script src ="../resources/js/jquery_1.12.4_jquery.min.js"></script>
<!-- 스크립트 파일 상위폴더 부터 지정 -->
<script>
		$(function() {
			function getClock() {
				//데이트 타입 을 date로 선언 후 객체 생성
				var date = new Date();
				// today의 date객체 toLocaleTimeString() 현재 날짜 오전 오후 끌어오기
				var today = date.toLocaleTimeString();
				// h1 태그의 아이디 clock 값을 text로 표현.
				$("#clock").text(today);
			};
			//함수호출
			getClock();
			// 셋인터버 함수, 1초
			setInterval(getClock,1000);
		});
	
</script>
</head>
<body>
	<h1 id="clock"></h1>
</body>
</html>