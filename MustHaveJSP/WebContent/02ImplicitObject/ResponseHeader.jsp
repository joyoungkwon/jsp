<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		// getTime 기본 타입 long 이여서 long 타입으로 캐스팅
		long add_date = s.parse(request.getParameter("add_date")).getTime();
		
		// input text  기본타입 은 문자열 이여서 숫자로 쓰고 싶음 쓰고하자는 타입의 캐스팅 이 필요함
		int add_int = Integer.parseInt(request.getParameter("add_int"));
		
		String add_str = request.getParameter("add_str");
		// add 는 그냥 추가. 
		response.addDateHeader("myBirthday", add_date);
		response.addIntHeader("myNumber", add_int);//8282
		response.addIntHeader("myNumber", 1004); //1004  추가
		response.addHeader("myName", add_str); 
		// set은 수정
		response.setHeader("myName", "안중근");
	%>
		
	<h2>응답 헤더 정보 출력하기</h2>
	
	<% // 스트릿틀립 선언부 포문 시작.
		// 컬렉션으로 String 제네릭으로 headerNames들 따오기 
		Collection<String> headerNames = response.getHeaderNames();
		for(String hName : headerNames){
			// 만들고자 하는 타입 : 저장할 객체.
			String hValue = response.getHeader(hName);
	%>
		<!-- HTML 태그 넣기 -->
		<li> <%= hName %>  : <%= hValue %></li>
	<% // 포문 닫기 (실행블록 사이 안에)
		}
	%>
	
	
	<h2>myNumber만 출력하기</h2>
	<%
		//여러개일떄 getHeaders로 myNumber의 값을 여러개 가져옴
		Collection<String> myNumber = response.getHeaders("myNumber");
		for(String myNum : myNumber){
			
	%>
		<li> myNumber : <%=myNum%>
	<%
		}
	%>
		
	
</body>
</html>