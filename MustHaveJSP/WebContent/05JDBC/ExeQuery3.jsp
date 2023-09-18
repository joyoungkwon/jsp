<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		// con = 연결 하는 connection
		// psmt = 동적 쿼리문 구축객체
		// stmt = 정적 쿼리문 구축 객체
		// rs = sql문 실행결과를 받을 객체
		
		Connection con =null;
		PreparedStatement psmt = null;
		Statement  stmt = null;
		ResultSet rs = null;
		
		try{
			//url,id,pw 값 세팅 연결하고자 하는 url member 자리에
			// 연결하고자하는 데이테베이스 넣고 ? 뒤는 한글처리 useUnicode
			String url ="jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			String id ="manager";
			String pw ="1234";
			// class 찾음 mysql 드라이버 
			Class.forName("com.mysql.jdbc.Driver");
			// 세팅한값으로 커넥션에 연결
			con = DriverManager.getConnection(url,id,pw);
			// sql구문 세팅 검색한다 * from student의 wher(조건)s_name이 like 홍씨인사람들만
			//like '홍%' = like앞 문자열이 홍으로 시작하는 사람 뒤에 %가 아무거나 ex)홍경례 홍길동 홍사범
			String sql ="select*from student where s_name like '홍%'";
			// 연결하고자 하는 쿼리선택후 커넥션 con의 createStatement로 생성한값을 
			// 정적쿼리객체로넘겨서 정적쿼리문 생성
			stmt = con.createStatement();
			// stmt정적쿼리의 Stirng sql executequery를 실행결과값을
			// 	resultSet의 리턴시킴		
			rs = stmt.executeQuery(sql);
			
			// resultset 의 다음요소가 없으면 false값을 반환시켜
			// 종료되는 while문 rs.next()
			while(rs.next()){
				//get스트링 = 첫번째 줄의 인덱스칸의값을 string으로받음
				//다음줄이있을때 next로 두번째줄로넘어가서 다시 첫번째칸 요소 뽑아옴
				String s_name =rs.getString(1);
				String s_id =rs.getString(2);
				String s_tel =rs.getString(3);
				String s_adress =rs.getString(4);
				out.print(s_name+s_id+s_tel+s_adress);
			}
			
		}catch(Exception e){
			e.getMessage();
			
			
		}finally{
			//자원해제
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(con !=null) con.close();
		}
	%>
</body>
</html>