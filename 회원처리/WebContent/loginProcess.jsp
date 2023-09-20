<%@page import="dto.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글처리
		request.setCharacterEncoding("utf-8");
	//로그인에서받아온값
		String id = request.getParameter("id");	
		String pw = request.getParameter("pw");	
		//loginmember(id,pw)메서드호출
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		// 내가보낸 파라미터값으로 member2테이블에 조건을 넣어서 검색한후
		// 읽어들일요소가있으면 setid로 dto에 rs.getString()메서드를 이용해
		// 읽어들인 칼럼을 각각 id,pw의 저장하는 메서드로. 로그인폼에서 보내는 값이,
		// member2에있을시에 result값으로 "로그인성공"아닐시엔""(null)이담기는 메서드호출
		String result = dao.loginMember(id, pw);
		String a ="";
		// null 아아니면 세션변수 userId값으로 폼에서보낸 id값을설정
		// null 아아니면 세션변수 userPw값으로 폼에서보낸 pw값을설정
		if(result!=null){
			 a = "로그인성공";
			session.setAttribute("userId", id);
			session.setAttribute("userPw", pw);
			// null일시 error변수에=1을담아서 login.jsp에 보냄.
		}else{
			request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		}
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<p><%=result %></p>
<p><%=a%></p>
<p><%=dto.getId()%></p>
</body>
</html>