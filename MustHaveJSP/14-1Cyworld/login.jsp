<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/index.css" rel="stylesheet" type="text/css">
<link href="./resources/css/layout.css" rel="stylesheet" type="text/css">

</head>
<body class="center-layout">
	<div class="center-layout-column">
		<img  alt="logo" src="./resources/img/Cyworld.png" class="log">
		<form action="LoginServlet" method="post" class="form_border">
			<table width="300">
				<tr height="40">
					<td width="120">아이디</td>
					<td width="180"><input type="text" name="id"></td>
				</tr>
				<%-- ${error} --%>
				<%
					String error = (String)session.getAttribute("error");
					if(error != null){
						out.print("<p>");
						out.print(error);
						out.print("</p>");
						session.removeAttribute("error");
					}
					
				%>
				<tr height="40">
					<td>비밀번호</td>
					<td><input type="text" name="pw"></td>
				</tr>
				<tr>
					<td></td>
					<td><div class="login-textright"><button type="submit">로그인</button></div></td>
				</tr>
			</table>
		</form>
		<div class="text-leftzero">
		<span>계정이없으신가요? <a href="Register.jsp" class="point">회원가입</a></span>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	
</body>
</html>