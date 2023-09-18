<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 
JSP forward 태그를 써서 넘겼을때
주소값 즉 URL 이 넘겼을때 바뀌지 않음(출력되지않음)
마찬가지로 page영역 못 받음. request는 서로 공유  --%>
<title>Insert title here</title>
</head>
<body>
	<h2>포워드 결과</h2>
		<ul>
			<li>
				page 영역:<%=pageContext.getAttribute("pAttr") %>
			</li>
			<li>
				request 영역:<%=request.getAttribute("rAttr") %>
			</li>
		</ul>
</body>
</html>