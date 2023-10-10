package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlCon {
	
	public Connection con;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;
	
	public MysqlCon() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/studentex?useUnicode=true&characterEncoding=utf8&useSSL=false";
			String id="manager";
			String pw ="1234";
			
			con = DriverManager.getConnection(url,id,pw);
			
			System.out.println("studentex database O");
		} catch (Exception e) {System.out.println("studentex database X"+e.getMessage());e.printStackTrace();}
		
	}
	// 사용하고 치우고 
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			System.out.println("student database 자원해제 성공");
		} catch (Exception e) {System.out.println("student database 자원해제 실패"+e.getMessage());}
	}
}
