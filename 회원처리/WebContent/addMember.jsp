<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
jsp액션태그 이용.
jsp:include해서, top으로 설정한 jsp 파일 불러오기.  --%>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<br><br>
	<%
		// addMemberProcess에서 문제가있을시 error변수에 1이나다른 문자열을
		//담아서보낼꺼임. error코드가 null이아니면 기존회원입니다를 out내장객체를 이용해
		//출력할꺼임
		String error = request.getParameter("error");
		if(error!=null){
			out.print("기존회원입니다.");
		}
		
	
	%>
	<%--addmemberProcess.jsp로 보냄, member2 테이블의 필드값과 맞춰서 9개. --%>
	<form action="addMemberProcess.jsp" method="post">
		아이디:<input type="text" name="id"><br>
		비밀번호:<input type="text" name="password"><br>
		이름:<input type="text" name="name"><br>
		성별:<input type="text" name="gender"><br>
		생년월일:<input type="text" name="birth"><br>
		메일주소:<input type="text" name="mail"><br>
		휴대폰번호:<input type="text" name="phone"><br>
		주소:<input type="text" name="address"><br>
		가입일자:<input type="text" name="registday"><br>
	<input type="submit" value="회원가입">
	</form>
	
</body>
</html>