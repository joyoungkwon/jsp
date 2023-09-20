<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");
		// addMember에서 폼값으로보낸값 받기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String registday = request.getParameter("registday");
		
		
		MemberDAO dao= new MemberDAO();
		// dao.checkMember(id)메서드 호출 
		// 메서드는, 파라미터값으로 id값을 넘겨받아
		// sql구문에서, 입력한 파라미터 값으로 select id from member where id=(내가입력한파라미터값)
		// 으로 내가넘긴 파라미터값을 가지고 while문을 넘겨서 rs객체의 동적쿼리문의 완성 결과를 리턴시키고
		// rs의 담긴 요소를 가지고 새로운 String id2를 가지고 rs.getString()을 이용해 설정해놓은 칼럼값의
		// 인덱스 에 요소를끌어와 id2값의 리턴시키고 그값을 가지고 비교하여 만약에 같을시에 result에 "기존회원이"이라는
		// 문자열을 리턴하는 메서드 아니면 "";
		String result = dao.checkMember(id);
		// 결과적으로 String result에는 ""아니면 "기존회원"이라는문자열을반환시키고
		//그값을가지고문자열과비교하여 "기존회원"일경우 addMember.jsp로 error변수에1값을 가지고 간다
		if(result.equals("기존회원")){
			request.getRequestDispatcher("addMember.jsp?error=1").forward(request, response);
		}else{
			//그렇지않으면 추가한다. (필드명에따라)
			dao.insertMember(id, password, name, gender, birth, mail, phone, address, registday);
		}
		dao.close();
		
	%>
	<h1><%=name%>님 회원가입 환영합니다.</h1>
</body>
</html>