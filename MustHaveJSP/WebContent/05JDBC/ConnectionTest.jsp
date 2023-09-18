<%@page import="common.*"%>
<%@page import="utils.OutPrint"%>
<%@page import="javax.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JDBC테스트</h2>
	<%
		// jdbc 자바 파일 생성자의 url, id , pwd 에 만들어놓은 con으로 연동한 생성자 호출
		// 자동연결
		JDBConnect jdbc1 = new JDBConnect();
		// 자원해제 close메서드 
		jdbc1.close();
	
	%>
	<h2>JDBC테스트2</h2>
	<%
		//web.xml을 편집하여 영역이 어플리케이션이기때문에
		// application.getInitParameter 으로 받아옴
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
		JDBConnect jdbc2 = new JDBConnect(driver,url,id,pwd);
		
		
		
		// JDBConnect2 의 생성자2 를 jspwriter로 파라미터 값으로 넘겨서 
		// 자바 코드에 html 내장객체인 out을 쓸수 있음
		// system.out.println이 였던 출력구문을 out으로 바꾼후
		// 실행하면 페이지에서 출력하고 보이는거 가능
		String driver2 = application.getInitParameter("MysqlDriver");
		String url2 = application.getInitParameter("MysqlURL");
		String id2 = application.getInitParameter("MysqlId");
		String pwd2 = application.getInitParameter("MysqlPwd");
		
		JDBConnect2 mySql = new JDBConnect2(driver2,url2,id2,pwd2,out);
		mySql.close();		
	%>
	<h2>JDBC 테스트 3</h2>
	<%
		JDBConnect jdbc3 = new JDBConnect(application);
		jdbc3.close();
	%>	
	
</body>

</html>