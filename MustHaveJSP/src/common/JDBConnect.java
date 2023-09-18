package common;

// 임포트 java.sql.다른거 혼동 주의
//
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspWriter;


public class JDBConnect {
	public Connection con; // 데이터 베이스 연결
	public Statement stmt; // 정적 쿼리문 사용 (조건 x)
	public PreparedStatement psmt; // 사용자 정의에 따라 (조건달려있을시 where) 검색하거나 값이 달라지는 동적 쿼리문
	public ResultSet rs; // 쿼리실행 결과저장
	
	//default 생성자
	//생성자라 자동 연결
	public JDBConnect() {
		
		try {
			//  mysql드라이버 이름 -com.mysql.jdbc.Driver 
			// JDBC 드라이버 로드 - oracle.jdbc.OracleDriver
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url ="jdbc:oracle:thin:@localhost:1521:xe"; // db접속 주소. 
			String id ="manager"; // 내가 생성한 사용자 계정 이름 manager
			String pwd ="1234"; // 맨처음에 설정한 패스워드값
			// 위의 설정 정보로 db의 연결함.
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("데이터 베이스 연결성공"+"\n(기본생성자 로 연결했습니다.)");
			
		} catch (Exception e) {
			System.out.println("데이터 베이스 연결 오류입니다.");
			// 콘솔창의 오류 출력 메서드
			e.printStackTrace();
			
		}
		
	}
	// result , con 호출한 순서 반대로 닫아주기.
	// rs , con의 순서는 반드시 맞추기.
	// 닫기 메서드
	// 어플리 케이션 겟 이니 파라미터
	public JDBConnect(String driver,String url, String id ,String pwd) {
		try {
			Class.forName(driver);
			con= DriverManager.getConnection(url, id, pwd);
			System.out.println("두번째 생성자 연결성공"+"(파라미터값이 있는 생성자로 연결했습니다.)");
			
		} catch (Exception e) {
			System.out.println("2번쨰 연결오류");
			e.printStackTrace();
		}
	}
	// web.xml에 설정한 값 어플리케이션 내장객체로 이용해서 끌어와서 설정하기.
	public JDBConnect(ServletContext application) {
		
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			
			String url= application.getInitParameter("OracleURL");
			String id= application.getInitParameter("OracleId");
			String pw= application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url,id,pw);
			
			System.out.println("어플리케이션 내장객체로 연결성공\n");
			
		} catch (Exception e) {
			System.out.println("어플리케이션 내장객체\t연결오류\n"+e.getMessage()); 
		}
		
	}
	
	
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(psmt!=null)psmt.close();
			if(con!=null)con.close();
			System.out.println("자원해제");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
