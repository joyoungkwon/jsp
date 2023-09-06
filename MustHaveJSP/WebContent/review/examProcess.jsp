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
		// 스트링 타입 id 타입의 exam1에서 받아온 파라미터값 id,pw를 각각
		// id,pw 변수의 저장.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 아이디가 틀릴시에는 어떻게 하라는 문제가 정해지지않았고 비밀번호 가 틀리시에만 문제예시 해주심
		// pw만 가지고 조건문 장식하고 "1234" 가 맞을시에는 result.jsp 파일로 연결하여 환영합니다 출력함
		
		if(pw.equalsIgnoreCase("1234")){
			response.sendRedirect("result.jsp");
		// 그러지않을시에는 request.getRequestDispatcher을 씀 exam.jsp로 보냄 / ? 뒤에 넣고자하는 변수명과 
		// = 으로값을 임의로 지정하고 .forward로 모든걸 넘김.
		}else{
			request.getRequestDispatcher("exam1.jsp?ps=1").forward(request, response);
		}
		//getRequestDispatchergetRequestDispatchergetRequestDispatchergetRequestDispatcher
		// 값 가지고 보낼떄는 무조건.getRequestDispatchergetRequestDispatchergetRequestDispatcher
	
	%>
</body>
</html>