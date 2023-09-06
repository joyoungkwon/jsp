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
	// request.setCharacterEncoding("utf-8"); - 요청식 한글 처리 방식
	// response.setCharacterEncoding(charset) -
		request.setCharacterEncoding("utf-8");
	// choice 라는 메인 구문에서 requset.(요청한다 파라미터로 choice 의 옵션값을 요청하고 fu의 저장한다.)
		String fu = request.getParameter("a");
	
	//result 파일에서 if문 추가. 만약 넘어온 값이 none이라면 다시 돌아갑니다
	// choice.jsp로 돌아갑니다. 파라미터값을 가지고 돌아가세요.
	
	if(fu.equalsIgnoreCase("none")){
		
		request.getRequestDispatcher("choice.jsp?none=1").forward(request, response);
		// getRequestDispatcher - 파라미터의 값을 가지고 가는 requset 내장객체 메소드
		// choice.jsp의 ? 뒤에 none 이라는 변수에 =1 이라는 값을 대입시켜 
		// forward (request , response) 제어값을 넘겨주고 처리 방식 토스 뜻.
		// 로 보내고 값을 리턴 시킴.
	}
	
	%>
	<!-- 표현식으로 태그의 값을 넣음. -->
	<h1>좋아하는 과일은 : <%=fu %></h1>
</body>
</html>