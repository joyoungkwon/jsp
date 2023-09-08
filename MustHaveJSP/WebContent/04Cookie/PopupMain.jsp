<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String popupMode ="on";
 	Cookie [] cookies = request.getCookies();
 	//쿠키가 null일때 Cookie
 	if(cookies != null){
 		for(Cookie c : cookies){
 			String cookiesName = c.getName();
 			String cookiesValue = c.getValue();
 			if(cookiesName.equals("PopupClose")){
 				popupMode=cookiesValue;
 			}
 		}
 	}
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
			// chkval의저장한다 input checkbox의 id가 inactiveToday 아이디값이 cheaked되면 .val값을 끌어와라.
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
			
			
			// ajax
			// url 보내고자 하는 url 
			// type type 은 메소드 방식 get , post
			// data 넘길 데이테 맵처럼 inactiveToday 이름의 chkVal이라는 벨류값
			// datatype 데이터 타입은 text
			// success inactiveToday:chkVal 이 넘어갔을떄 실행되는 자바스크립트 함수 호출
			// if 조건문 inactiveToday:chkVal 이 resData로 넘어갔을때
			// if 에서 데이터가 빈 공간이 아닐때. 쿠키를 받은것 처럼 페이지를 새로고침 함
			$.ajax({
				url:'PopupCookie.jsp',
				type:'get',
				data:{inactiveToday:chkVal},
				dataType :"text",
				success : function(resData) {
					if(resData != '') location.reload();
				}
			});
			
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
	<h1 id="a"></h1>
</body>
</html>