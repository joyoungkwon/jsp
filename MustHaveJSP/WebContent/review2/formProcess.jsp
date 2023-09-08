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
		request.setCharacterEncoding("utf-8");
	
		
		// 아이디 값을 받아오은 requset getParmeter (넘겨받는 파일의 변수 이름.)
		String id =request.getParameter("id");
		String pw = request.getParameter("pw");
		String name =request.getParameter("name");
		String gender = request.getParameter("gender");
		String[]hobby = request.getParameterValues("hobby");
		
		String hobby2 = ""; // 선택 한값 저장 용도
		for(String hobbyValue : hobby){ // String 타입의 하비벨류를 hobby 배열의 저장 시키는거 (값이 있을때마다 생성)
			// 저장용도 hobby2에 벨류로 뽑아온값이랑 띄어쓰기를 더해서 리턴
			hobby2 += hobbyValue +" ";
		}
		
		String hobby3 =" ";
		for(int i =0; i<hobby.length;i++){
			hobby3 += hobby[i]+ "" ;
		}
	
	%>
	아이디: <%=id %><br>
	비밀번호: <%=pw %><br>
	이름: <%=name %><br>
	성별: <%=gender %><br>
	취미:<%= hobby2 %><br>
</body>
	
</html>