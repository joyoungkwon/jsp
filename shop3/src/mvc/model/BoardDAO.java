package mvc.model;

import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO extends DBConnection{

	
	
	public BoardDAO() {
		super();
	}
	
	
	
	
	public int getListCount(String items, String text) {
		int count =0;
		String sql;
		try {
			if(items==null && text == null) {
				sql ="select count(*) from board";
			}else {
				sql ="select count(*) from board where " +items+" like '%" + text +"%'";
			}
			
			psmt = con.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
		
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("게시물 세기 getListCount() 성공");
			
		} catch (Exception e) {
			System.out.println("게시물 세기 getListCount() 실패"+e.getMessage());
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	public ArrayList<BoardDTO>getBoardList(int page , int limit , String items , String text){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		int total_record = getListCount(items, text);
		int start = (page-1)*limit;
		int index = start+1; // 시작지점
		
		String sql;
		
		if(items == null && text == null) {
			sql ="select * from board order by num desc";
		}else {
			sql ="select * from board where "+items+" like '%"+ text + "%' order by num desc";
		}
		
		try {
			psmt =con.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.absolute(index)) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setRegist_day(rs.getString(6));
				dto.setHit(rs.getInt(7));
				dto.setIp(rs.getString(8));
				
				list.add(dto);
				
				if(index < (start + limit) && index <= total_record) {
					index++;
				}else {
					break;
				}
			}
			System.out.println("getBoardList()메서드 실행 성공");
			
			return list;
		} catch (Exception e) {
			System.out.println("getBoardList()메서드 실행 실패" + e.getMessage());
			e.printStackTrace();
		}
		
		return null;
	}
}
