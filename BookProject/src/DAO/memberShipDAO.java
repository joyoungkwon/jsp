package DAO;

import DTO.MemberShipDTO;
import common.JDBConnect;

public class memberShipDAO extends JDBConnect {

	public memberShipDAO() {
		super();
	}
	
	public  MemberShipDTO selectMember(String id , String pw ) {
		
		MemberShipDTO dto = new MemberShipDTO();
		String sql = "select * from membership where memberid=? and memberpw=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMemberid(rs.getString(1));
				dto.setMemberpw(rs.getString(2));
				dto.setMembername(rs.getString(3));
				dto.setMemberaddress(rs.getString(4));
				dto.setMembertel(rs.getString(5));
			}
			
			System.out.println("아이디 비번 검색성공");
		} catch (Exception e) {
			System.out.println("아이디 비번 검색 실패"+e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
	
//	public void insertMember(String id, String pw , String name ,String address,String tel) {
//		String qery = "insert into membership values (?,?,?,?,?)";
//		
//		try {
//			psmt = con.prepareStatement(qery);
//			psmt.setString(1, id);
//			psmt.setString(2, pw);
//			psmt.setString(3, name);
//			psmt.setString(4, address);
//			psmt.setString(5, tel);
//			
//			psmt.executeUpdate();
//			
//			System.out.println("멤버 데이터 추가성공");
//		} catch (Exception e) {
//			System.out.println("멤버데이터 추가실패\n"+e.getMessage());
//			e.printStackTrace();
//		}
	
	public int insertMember(String id, String pw , String name ,String address,String tel) {
		int result =0;
		
		String qeury ="insert into membership values(?,?,?,?,?)";
		try {
			psmt =con.prepareStatement(qeury);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, address);
			psmt.setString(5, tel);
			
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {System.out.println("회원추가실패");e.getMessage();}
		return result;
	}
	
	
	
	public int deleteMember(String id, String pw) {
		
		int result =0;
		String query ="delete from membership where memberid=? and memberpw=?";
		
		try {
			
			psmt =con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			
			result =psmt.executeUpdate();
			
			
			System.out.println("회원삭제성공");
		} catch (Exception e) {
			System.out.println("회원삭제실패"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
}
