package dao;


import common.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect {
	
	

	public MemberDAO() {
		super();
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pw=?";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setAddress(rs.getString(5));
			}
		} catch(Exception e) {
			System.out.println("db 연결 실패");
		}
		
		return dto;
	}
	
	public void insertMember(String id, String name, String password, String phone, String address) {
		String query = "insert into member values(?,?,?,?,?)";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, password);
			psmt.setString(4, phone);
			psmt.setString(5, address);
			psmt.executeUpdate();
			System.out.println("회원 추가 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 추가 실패");
		}

	}
	
	public String deleteMember(String id,String password) {
		String query = "select * from member where id=?";
		String result="";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String password2 = rs.getString(3);
				
				if(password.equals(password2)) {
					result="삭제";
					String query2 = "delete from member where id=?";
					psmt = con.prepareStatement(query2);
					psmt.setString(1, id);
					psmt.executeUpdate();
					break;
				}else {
					result="";
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 삭제 실패");
		}
		return result;
	}
	
	
	
	public String editMember(String id, String name,String pw, String phone,String address) {
		
		
		
		String sql ="update member set name=?,pw=?,phone=?,address=? where id=?";
		String result = "";
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1,name);
			psmt.setString(2,pw);
			psmt.setString(3,phone);
			psmt.setString(4,address);
			psmt.setString(5,id);
			
			
			psmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage()+"회원정보 수정 실패");
			
		}
		
		return result;
	}
	
}
