<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키설정</h1>
	<%
		// 쿠키 생성
		// 쿠키는 이름과 값으로 저장되있음.
		Cookie cookie = new Cookie("myCookie","내가만든쿠키");
		// 기본적으로 세팅 할때는 set 쓰고 원하는 메소드 호출 하고 세팅함.
		
		// getContextPath 쿠키가 속해있는경로 값 받아오기
		cookie.setPath(request.getContextPath());
		// 쿠키가 가지고 있을수 있는 값을 초단위로 설정.
		cookie.setMaxAge(60*60); // <- 1시간 유지 
		// 쿠키를 만들어서 쿠키상자에 담아서 보냄 ㅋㅎ
		response.addCookie(cookie); // 응답헤더의 쿠키를 추가하는 메서드
	%>
	<h2>쿠키설정 후 값 확인하기</h2>
	<%
		// 쿠키를 받는 get 쿠키는 일반적으로 배열 타입을 선언하고 값을 저장시킴
		Cookie [] cookies = request.getCookies();
		// 조건문 위에서 생성한 myCookie 의 벨류값 내가만든 쿠키를 생성하고
		// 셋으로 설정한값을 
		// 겟으로 받아올때
		// 일반적으로 쿠키는 배열 타입으로 값을 불러오고
		// 그 쿠키의 값이 null 이 아니면 cookies의 저장되어있는 값만큼 Cookie c 를 생성
		// String 타입의 cookieName 의 c로 쿠키의 네임값을 겟 네임으로 받고 저장하고
		// 같은방식으로 value 로 지정하고 저장하고 벨류값을 저장후 
		// out프린트 내장객체로 출력
		if(cookies != null){
			for(Cookie c:cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.print(cookieName + ":\t" + cookieValue+"<br>");
			}
		}
	%>
	<h2>페이지 이동후 쿠키값을 확인</h2>
		<a href="CookieResult.jsp">쿠키 먹으러가기</a>
</body>
</html>