<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>와따 그냥 확실하게 폼값을 전송해 보자꾸나~!</h1>
	<form action="FromResult.jsp" method="post">
		이름:<input type="text" name="name"><br>
		성별:<input type="radio" name="gender" value="남자"> 남자
		<input type="radio" name="gender" value="여자">여자
		<br>
		학력:<select name="grade">
			<option value="중졸">중졸</option>
			<option value="고졸">고졸</option>
			<option value="대졸">대졸</option>
		</select><br>
		관심사항:
		<input type="checkbox" name="inter" value="정치">정치
		<input type="checkbox" name="inter" value="경제">경제
		<input type="checkbox" name="inter" value="연예">연예
		<input type="checkbox" name="inter" value="운동">운동 <br>
		<input type="submit" value="어어그래 잘가고 보내버려라">
	</form>	

</body>
</html>