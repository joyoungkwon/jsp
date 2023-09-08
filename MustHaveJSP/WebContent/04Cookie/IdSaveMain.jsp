<%@page import="utils.CookieManager"%>
<%@page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// CookieManager.readCookie= 내가 넣는 파라미터 값의 이름이랑 
    	// 같은 값이 같은지 비교하는 메서드.
    	// loginId랑 같은 값을 비교해서 같은 값을 넣거나 없으면 없는걸 리턴 시킴.
    	String loginId = CookieManager.readCookie(request, "loginId");
    	// checked를 저장 시킬려는 변수
    	String cookieCheck ="";
    	// 로그인 아이디의 "" 값이 아닌 값이 들어오면
    	if(!loginId.equals("")){
    		// 체크드를 저장시킴.
    		cookieCheck="checked";
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
		<%-- loginId로 표현식 을 한 이유는 main에서 내가 계속 쓰는값은 변하니깐 그 변한한 값이 바뀔때마다 바꾼걸 저장할수 있게하려고. --%>
		아이디 <input type="text" name ="user_id" value="<%=loginId %>">
		<%-- 위에 설정한 스트릿틀립 의 체크드 값을 저장시킴 --%>
		<input type="checkbox" name ="save_check" value="Y" <%=cookieCheck %>>아이디저장하기<br>
		패스워드 : <input type="text" name="user_pw"><br>
		<input type="submit" value="로그인하기">
	</form>
</body>
</html>