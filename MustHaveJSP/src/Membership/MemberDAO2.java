package Membership;
import common.*;

public class MemberDAO2 extends JDBConnect {
	
	
	// drv , url ,id,pw 파라미터로 입력한대로 세팅하는 생성자
	public MemberDAO2() {
		
	}
	
	// getMemberDTO
	public MemberDTO getMemberDTO (String uid,String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			
			
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getNString(3));
				dto.setRegidate(rs.getString(4));
			}
			
		} catch (Exception e) {
			System.out.println("연결실패");
		}
		
		return dto;
	}
	
}
