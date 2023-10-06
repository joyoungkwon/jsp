<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="el.*" %>

<%
	MyELClass myClass = new MyELClass();
	pageContext.setAttribute("myClass", myClass);
	
	String jumin = request.getParameter("jumin");
	
	pageContext.setAttribute("jumin", jumin);
	
	if(jumin != null) {
		pageContext.setAttribute("gender", myClass.getGender(jumin));
		// 이거의 의미 자체가 이메일:<input type="text" name="email"> 과 +@+ 과 <select name="email2"> 을 합쳐서
		// 고른걸 email이라는 변수안에 아이디와 옵션값으로 고른 벨류값을 @를 붙혀 한 문장으로 저장 시킨다.
		String email = request.getParameter("email")+"@"+request.getParameter("email2");
		
		pageContext.setAttribute("result", myClass.getEmail(email));
		pageContext.setAttribute("domain", myClass.getDomain(email));
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<form id="a" action="#" method="post" >
	이름:<input type="text" name="name"><br>
	주민번호:<input type="text" name="jumin"><br>
	이메일:<input type="text" name="email">@
		<select name="email2">
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="google.com">google.com</option>
		</select>
		<br>
		<input type="submit" value="전송하기">
	</form>

	<h1>EL태그로받기</h1>
	<h2>성별 확인</h2>
	<h3>예린 : ${myClass.getGender("000904-4111111")}</h3>
	
	<br>                      
	
	<h1>form 값으로받기</h1>
	<h3>이름 :${param.name}</h3>
	<h3>주민 :${jumin}</h3>
	<h3>성별확인 : ${gender}</h3>
	<h3>이메일 아이디 : ${result} </h3>
	<h3>이메일 도메인 : ${domain} </h3>
</body>
</html>