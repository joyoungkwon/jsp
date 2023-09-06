<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>요청에서 헤더 정보 출력하기</h2>
 	<%
 		Enumeration headers = request.getHeaderNames();
 		//hasMoreElements -요소가 있다면
 		// headers.hasMoreElements 헤더스의 요소가 있다면.(데이터)
 		while(headers.hasMoreElements()) {
 			String headerName = (String)headers.nextElement();
 			String headerValue = request.getHeader(headerName);
 			out.print("헤더명" + headerName+"해더값" + headerValue+"<br>");
 		}
 
 
 
 	%>
</body>
</html>