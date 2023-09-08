<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String popupMode ="on";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- css 연결하기 rel로 stlyesheet  href="있는폴더/가지고올CSS파일이름.CSS" --%>
<link rel="stylesheet" href="css/Cookie.css" >
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	 // 레디구문 마지막으로 생성함 input구문의 버튼의 아이디값을 클릭으로 연결 하고
	 // 클릭을 하면 함수를 호출한다. 전체를 감싸고있는 popup자체를 hide로 숨겨버리기
	$(function() {
		$("#closeBtn").click(function() {
			$("#popup").hide();
		});
	});
</script>
</head>
<%
	// 그냥 10번 반복문
	for(int i =1 ; i<=10; i++){
		out.print("현재 팝업창은"+popupMode+"상태입니다."+"<br>");
	}
	// 위에 설정한 String값
	if(popupMode.equals("on")){
%>
<body>
	<%-- --%>
	<div id ="popup">
		<h2 align="center">팝업입니다!희희.</h2>
		<div align="right"><form name="popFrm">
			<input type="checkbox" id="inactiveToday" value="1">
			하루열지않음
			<input type="button"  value="닫기" id="closeBtn">
		</form></div>
	</div>
	<%} %>
</body>
</html>