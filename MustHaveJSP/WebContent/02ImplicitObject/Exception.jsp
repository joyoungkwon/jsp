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
		// 에러코드 숫자 저장 변수	
		int status = response.getStatus();
		// Not Found
		if(status == 404){
			out.print("404에러가 발생했습니다");
			out.print("</br> 파일 경로를 확인해주세요");
		// Method Not Allowd
		}else if( status == 405){
			out.print("405 에러가 발생했습니다");
			
			out.print("메소드 방식을 확인하세요");
		// internal Server Error
		}else if( status ==500){
			out.print("500 에러가 발생했습니다");
			out.print("소스코드에 오류가 없는지 확인하세요");
		}
		
		
	%>
</body>
</html>