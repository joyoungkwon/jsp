<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 확인</title>
</head>
<body>
	<h1>쿠키값확인</h1>
	<%
		// 일반적으로 쿠키는 배열을 생성해서 받아들이고 받아들일땐ㄴ
		// requset.getCokies라는 함수를 통해 받아서 저장함
		Cookie [] cookies = request.getCookies();	
		// 일반포문. 배열로 제로인덱스 를 뽑아오기위해 i값을0으로
		// i가 배열길이보다 작을때까지만 루프타고
		// 그루프탈때마다 cookies배열의 i번쨰 방마다의 getName을 , getValue를
		// String 타입의 name, value의 저장
		// 하고 값을 담은 변수를 포문의 길이만큼 출력
		for(int i=0; i<cookies.length; i++){
			String cookiesName = cookies[i].getName();
			String cookiesValue = cookies[i].getValue();
			out.print(cookiesName+"\t"+cookiesValue+"<br>");
		}
	%>
</body>
</html>