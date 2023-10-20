package DB;

import java.util.ArrayList;
import java.util.List;

import Connect.MysqlDB;

public class MemberShipDAO extends MysqlDB {

	public MemberShipDAO() {
		super();
	}

	
	
	
	
	public MemberShipDTO selectlist(String id, String pw) {
		MemberShipDTO dto = new MemberShipDTO();

		String sql = "select * from membership where id=? and pass=?";

		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();

			while (rs.next()) {

				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setPhoneNum(rs.getString(7));
				dto.setAdress(rs.getString(8));
				dto.setRegist_day(rs.getDate(9));

			}

			System.out.println("selectlist()검색성공");

		} catch (Exception e) {
			System.out.println("selectlist()검색실패" + e.getMessage());
			e.printStackTrace();
		}

		return dto;

	}
}
