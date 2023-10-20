package Connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlDB {
	
	
	public Connection con ;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;
	
	public MysqlDB() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String url ="jdbc:mysql://localhost:3306/mvctest?useUnicode=true&characterEncoding=utf8";
			String id ="manager";
			String pw ="1234";
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("MysqlDB()데이터 베이스 연결 메서드 성공");
			
		} catch (Exception e) {
			System.out.println("MysqlDB()데이터 베이스 연결 메서드 실패"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(con!=null) {
				con.close();
			}
			System.out.println("DB.Close()메서드종료 성공");
			
		} catch (Exception e) {
			
			System.out.println("DB.Close()메서드종료 실패"+e.getMessage());
			e.printStackTrace();
		}
	}
}
