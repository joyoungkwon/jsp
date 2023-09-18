<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<span style="color:red; font-size:1.2em;">
	<%--loginprocess.jsp에서 로그인이안되면 LoginErrMsg 로 값을 담아둔 걸로 받아서 LoginErrMsg 벨류값 출력--%>
	<%= request.getAttribute("LoginErrMsg") == null ? "":request.getAttribute("LoginErrMsg")%>
	</span>
	
	<%
		// 세션의 SatAttribute 로 보낸 UserId가 널이면(공백이면)
		
		if(session.getAttribute("UserId") ==null){
	%>
		<!-- // 세션의 SatAttribute 로 보낸 UserId가 널이면 함수생성하고
		연결한 함수값 실행. -->
		<script>
			// 폼자체를 넘김(파라미터 form)
			function validateForm(form) {
				//!form.user_id.value값의 
				// !값이 없을때.
				// javaScript 에 있는 함수
				// alert를 이용하여 페이지의 경고창으로"아이디를 입력하세요 를 출력하고."
				// 결과값을false;로 리턴함
				if(!form.user_id.value){
					alert("아이디를입력하세요");
					return false;
				}
				//위랑 같은 조건 "" 이나 !form.user_id.vale나
				// 보내는 user의 id나 pw값이 없을때 경고창 으로"패스워드를 입력하라고 출력"
				if(form.user_pw.value==""){
					alert("패스워드를입력하세요")
					return false;
				}
			}
		
		</script>
	<%--자바스크립트 구문에 함수에 파라미터값이 form인 거에 onsubmit로(트루값이면 로그인프로세스로이동,false면 실행 중지넘어가지않음)
	true값이면 this가 밑에있는 폼 전체를 넘김. --%>
	<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this)">
		아이디:<input  type="text" name="user_id"><br>
		비밀번호:<input  type="text" name="user_pw"><br>
			<!-- 일반적으로 이 submit input태그에 onclick 이벤트를 걸고 위에 스크립트 함수값의 결과값을 가진 this를
			담아서 보내는것이 일방적 () -->
			<input type="submit" value="로그인하기"> 
	</form>
	<%}else{%>
	
		<%=session.getAttribute("UserName") %> 회원님, 로그인하셨습니다<br>
		<a href="Logout.jsp">로그아웃</a>
		
	<%} %>
</body>
</html>