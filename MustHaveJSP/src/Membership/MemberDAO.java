package Membership;
import common.*;


public class MemberDAO extends JDBConnect {
	
	
	
	public MemberDAO() {
		super();
	}

	// drv , url ,id,pw 파라미터로 입력한대로 세팅하는 생성자
	public MemberDAO(String drv,String url , String id ,String pw) {
		super(drv,url,id,pw);
	}
	
	// getMemberDTO 찾는메서드.
	// loginform에서 보낸값을 파라미터로 받는
	public MemberDTO getMemberDTO (String uid,String upass) {
		//게터세터 메서드 클래스
		MemberDTO dto = new MemberDTO();
		// sql문에서 찾는 동적 쿼리문 세팅
		String query = "SELECT * FROM member where id=? and pass=?";
		
		try {
			//동적쿼리문에 커넥션으로 동적쿼리문생성할떄 sql문 대입시켜서
			//동적쿼리문 생성
			psmt = con.prepareStatement(query);
			
			// 위에 설정 해놓은 sql문의 ?자리에 차례대로
			// 입력한 id와 pass값을 대입
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			// rs객체의 psmt.executeQuery써서 실행값리턴
			rs = psmt.executeQuery();
			
			// 다음요소가 없을때까지 반복하는 next
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
