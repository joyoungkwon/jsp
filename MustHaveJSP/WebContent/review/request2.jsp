<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 으로 보내다 , action "process.jsp 파일로" 
    어떻게 , 메소드는 겟과 포스트 방식이 있다 지금은 post방식으로 -->
	<form action="process2.jsp " method="post">
		<p>
			아이디 : <input type="text" name="id"><br>
			비밀번호: <input type="password" name="pw"><br>
				<input type="submit" value="전송">
		</p>
	</form>
</body>
</html>