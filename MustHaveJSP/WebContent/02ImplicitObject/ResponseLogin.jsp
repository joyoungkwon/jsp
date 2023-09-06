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
		// id 값의 requset(요청하다) getParameter로 user_id값을
		String id = request.getParameter("user_id");
		// id 값의 requset(요청하다) getParameter로 user_pwd값을
		String pw = request.getParameter("user_pwd");
		// 여러개의 값을가져올떈 request.getvalues 문자열의 배열로 저장해야함
		
		
		// web.xml의 전역으로 쓸수 있는 id변수의 자바 를 pw변수의 value값을 1234로 설정하여
		// application.getInitParameter 로 호출 후 if조건식에서 equalsIgnoreCase <- 대소문자를 가리지않고
		// 문자열을 비교 하고 && 연산자로 두가지의 조건을 모두 만족시킬때. ResponseWelcom.jsp 의 사이트 로
		// 파라미터 값을 가지고 가지않는 sendRedirect 메서드로 이동시켜 ResponseWelcom.jsp 의 저장되어 있는
		// 환영합니다 문구 출력.
		if(id.equalsIgnoreCase(application.getInitParameter("id"))
			&& pw.equalsIgnoreCase(application.getInitParameter("pw"))){
			response.sendRedirect("ResponseWelcom.jsp");
			//response = 요청온걸 보내다 sendRedirect = 파라미터값 x
		}else{
			//getRequestDispatcher 파라미터값있이 넘겨주기
			request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
		}

	%>

</body>
</html>