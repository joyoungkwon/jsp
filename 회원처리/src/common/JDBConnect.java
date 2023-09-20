package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;

public class JDBConnect {

	public Connection con;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;
	
	
	public JDBConnect() {
		
		try {
			
			// 클래스 찾기
			Class.forName("com.mysql.jdbc.Driver");
			// driver멤버의 url, member2데이터베이스 주소 ? 뒤에는 한글처리 마지막 useSSL=fasle;는 콘솔창에 빨간 에러메세지 줄이기
			String url="jdbc:mysql://localhost:3306/member2?useUnicode=true&characterEncoding=utf8&useSSL=false";
			// 처음 설정한 매니저 id
			String id="manager";
			// 처음설정한 패스워드값 1234
			String pw="1234";
			// Connection 객체 con의 DriverManager의 .getConnection메서드를 이용해
			// 세팅해놓은 url주소와 id,pw값으로 연결하여 con의 저장
			con=DriverManager.getConnection(url,id,pw);
			// try가 성공했으면 성공했다 출력구문
			System.out.println("default생성자로\n연결성공\n");
			// 예외 발생시 e.getMessge로 오류메세지 호출
		} catch (Exception e) {
			System.out.println("DB연결실패"+e.getMessage());
		}
		
	}

	
	// void타입 닫는 메서드
	public void close() {
		try {
			// 자원을 해제 하는 close메세지.
			// 위에서 세팅한 순서의 반대로 닫아야함. 가운데 쿼리실행문은상관없지만
			// rs와,con의순서는 맞춰야함
			if(rs!= null)rs.close();
			if(psmt!= null)psmt.close();
			if(stmt !=null)stmt.close();
			if(con!= null)con.close();
			System.out.println("자원해제 성공");
			// 예외처리시 e.getmessge로 실행.
		} catch (Exception e) {System.out.println("자원해제실패"+e.getMessage());}
	}
	
}
