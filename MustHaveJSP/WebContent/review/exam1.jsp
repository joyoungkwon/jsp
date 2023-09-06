<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 비밀번호가 틀릴시에는 examProcess.jsp에서 받아온 1값을 ps에 저장
		
		String ps = request.getParameter("ps");
	
		// ps의 변수값의 어떠한 값이 리턴되어있을시에
		// 비밀번호가 틀립니다라는 문구출력
		
		if(ps!=null){
			out.print("비밀번호가 틀립니다.");
		}
	%>
	
	<!-- 전송하기 보내는 기본틀 . 아이디 비번을 examProcess.jsp 로 넘긴다는 뜻 -->
	
	<form action="examProcess.jsp">
		아이디: <input type="text" name="id"> 
		비밀번호: <input type="password" name="pw"> 
		<br>
		<!-- 전송 -->
		<input type="submit" value="전송하기">
	</form>
	
</body>
</html>