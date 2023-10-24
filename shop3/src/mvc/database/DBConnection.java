package mvc.database;

import java.sql.*;

public class DBConnection {

	public Connection con;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;

	public DBConnection() {

		try {

			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/mvcboard?useUnicode=true&characterEncoding=utf8&useSSL=false";

			String user = "manager";

			String password = "1234";

			con = DriverManager.getConnection(url, user, password);

			System.out.println("연결성공");

		} catch (Exception e) {
			System.out.println("연결실패" + e.getMessage());
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();

			System.out.println("데이터베이스 연결해제 성공 close()");

		} catch (Exception e) {
			System.out.println("데이터베이스 연결해제 실패 close()" +e.getMessage());
			e.printStackTrace();
		}
	}

}
