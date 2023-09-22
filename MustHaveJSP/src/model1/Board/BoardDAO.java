package model1.Board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map< String , Object > map) {
		int totalCount=0;
		String query = "select count(*) from board";
		
		if(map.get("sercahWord")!=null) {
			query+=" where " +map.get("sercahField") +" like '%" +map.get("sercahWord")+"%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
			System.out.println("개시물 개수 추가 성공 ");
			
		} catch (Exception e) {
			
			System.out.println("게시물 개수 오류\n"+e.getMessage());
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	public List<BoardDTO> selectList(Map<String,Object>map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		String query = "select * from board";
		if(map.get("sercahWord")!=null) {
			query+= " where " +map.get("sercahField")+" like '%" +map.get("sercahWord")+"%'";
		}
		query += " order by num desc";
		try {
			stmt = con.createStatement();
			rs =stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("Num"));
				dto.setTitle(rs.getString("Title"));
				dto.setContent(rs.getString("Content"));
				dto.setPostdate(rs.getDate("Postdate"));
				dto.setId(rs.getString("Id"));
				dto.setVisitcount(rs.getString("Visitcount"));
				
				bbs.add(dto);
				
			}
			System.out.println("게시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패\n"+ e.getMessage());
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result =0;
		try {
			
		String query =" insert into board(num,title,content,id,visitcount) values(seq_board_num.NEXTVAL,?,?,?,0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
			
			System.out.println("게시물 추가 성공");
			
		} catch (Exception e) {
			System.out.println("게시물 추가 실패"+e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query= "select B.*,M.name" 
				+ " from member M"
				+ " inner join board B " 
				+ "on M.id=B.id" 
				+ " where num=?";
				
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			System.out.println("성공");
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString(7));
			}
			
		} catch (Exception e) {
			System.out.println("실패"+e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
	
	
	public void updateVisitCount(String num) {
		
		
		
		String qeury="update board SET visitcount=visitcount+1 where num=?";
		
		
		try {
			psmt = con.prepareStatement(qeury);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			
			System.out.println("게시물\t조회\t증가성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 증가실패");
		}
	}
	
	public int UpdateEdit(BoardDTO dto) {
		int result =0;
		String sql ="update board set title=?,content=? where num=?";
		
		try {
			psmt =con.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			
			System.out.println("게시물 수정 성공");
		} catch (Exception e) {
			System.out.println("게시물 수정 실패 \n"+e.getMessage());
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	
	public int deletePost(BoardDTO dto) {
		int result =0;
		String qery ="delete from board where num=?";
		try {
			psmt =con.prepareStatement(qery);
			psmt.setString(1, dto.getNum());
			
			result =psmt.executeUpdate();
			System.out.println("삭제성공");
		}catch (Exception e) {
			System.out.println("삭제실패\n"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	
}
