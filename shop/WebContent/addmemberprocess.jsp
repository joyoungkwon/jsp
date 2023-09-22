<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// login jsp 에서 보낸 id값 
	// get 파라미터 받고
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");		
	String phone = request.getParameter("phone");		
	String address = request.getParameter("address");		
	
	// 게터세터 있는 dao 구현
	MemberDAO dao = new MemberDAO();
	// sql구문에서 멤버의 모든요소 검색하고
	String sql = "select * from member";
	//동적쿼리로 dao.con.
	PreparedStatement psmt = dao.con.prepareStatement(sql);
	//
	ResultSet rs = psmt.executeQuery();
	
	// 담을 변수
	String result="";
	// 다음요소가 있을시에 id2에 rs.id첫번째값으로 바꿔치기
	while(rs.next()) {
		String id2 = rs.getString(1);
				
		// 보낸값과 id2세팅 값이 같을시에
		if(id.equals(id2)) {
			// 중복
			result="기존회원";	
			// 에러 변수에 뭔가 하나 담아서 다시 보냄.
			request.getRequestDispatcher("addmember.jsp?error=1").forward(request,response);
			break;
		} 
	}
	// 아니면 insert 멤버 호출 해서 파라미터 값대로 넣고 생성.
	dao.insertMember(id, name, password, phone, address);
	dao.close();
	

%>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<div class="container">
			<h1 class="display-5"><%=name%>님 회원가입을 환영합니다!!</h1>
	</div>
</body>
</html>