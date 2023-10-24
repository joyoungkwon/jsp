package mvc.model;

import java.util.ArrayList;
import java.util.List;

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
	
	public void insertWrite(BoardDTO dto) {
		String sql ="insert into board values(null,?,?,?,?,?,?,?)";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getSubject());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getRegist_day());
			psmt.setInt(6, dto.getHit());
			psmt.setString(7, dto.getIp());
			
			psmt.executeUpdate();
			
			System.out.println("insertWrite()게시물 추가 성공");
			
			
		} catch (Exception e) {
			System.out.println("insertWrite()게시물 추가 실패" + e.getMessage());
			e.printStackTrace();
		}
		
	}
	public  BoardDTO selectView(String num) {
//		BoardDTO dto =null;
		BoardDTO dto = new BoardDTO();
		String sql ="select * from board where num=?";
		try {
			
			UpdateHit(num);
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setSubject(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setRegist_day(rs.getString(6));
				dto.setHit(rs.getInt(7));
				dto.setIp(rs.getString(8));
			}
			return dto;
			
			
		} catch (Exception e) {
			System.out.println("selectView()상세보기 실패"+ e.getMessage());
			e.printStackTrace();
			return null;
		}
		
	}
	
	public void  UpdateHit(String num) {
		
		String  sql = "update board set hit = hit+1 where num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, num);
			psmt.executeUpdate();
			
			System.out.println("UpdateHit()방문자수 증가성공");

			
		} catch (Exception e) {
			System.out.println("UpdateHit()방문자수 증가실패"+e.getMessage());
			e.printStackTrace();
		}
		
	}
	public void Editboard(BoardDTO dto) {
		String sql ="update board set subject=?,content=? where num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getSubject());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNum());
			
			psmt.executeUpdate();
			
			System.out.println("Editboard()게시물 수정 성공");
			
		} catch (Exception e) {
			System.out.println("Editboard()게시물 수정 실패"+e.getMessage());
			e.printStackTrace();
		}
		
	}
	public void deletboard(BoardDTO dto) {
		String sql ="delete from board where num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getNum());
			
			psmt.executeUpdate();
			System.out.println("deletboard()메서드 실행성공 삭제성공");
			
		} catch (Exception e) {
			System.out.println("deletboard()메서드 실행성공 삭제실패"+e.getMessage());
			e.printStackTrace();
		}
		
	}
}
