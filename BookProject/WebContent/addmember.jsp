<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addmemberProcess.jsp" method="post">
		<table>
			<tr>
				<td>
				아이디:<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td>
				비번:<input type="text" name="pw">
				</td>
			</tr>
			<tr>
				<td>
				이름:<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>
				주소:<input type="text" name="address">
				</td>
			</tr>
			<tr>
				<td>
				전화번호:<input type="text" name="tel">
				</td>
			</tr>
		</table>
		<button type="submit">회원가입하기</button>
	</form>

</body>
</html>