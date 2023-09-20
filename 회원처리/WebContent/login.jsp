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
	//loginProcess.jsp에서 보낸 error값이 null아니면
		String error = request.getParameter("error");
			if(error!=null){
				out.print("아이디와 비밀번호가 틀렸습니다");
			}
	%>
	<form action="loginProcess.jsp" method="post">
		아이디:<input type="text" name="id"><br>
		비밀번호:<input type="text" name="pw"><br>
	<input type="submit" value="전송하기">
	</form>
	
</body>
</html>