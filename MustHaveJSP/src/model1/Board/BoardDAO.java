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
	
	//map타입파라미터 int타입메서드 게시물갯수끌어오기
	public int selectCount(Map< String , Object > map) {
		int totalCount=0;
		String query = "select count(*) from board";
		// select count(*) from board where (서치필드검색조건)like%mep.get()
		
		if(map.get("sercahWord")!=null) { // 검색 하는 단어 값이 널이 아니라면 , 검색하는단어가있다면
			// 이어지는 붙히는 query문이나 sql문 작성시 앞자리와 뒷자리에 공백 반드시 필수
			//searchField 검색하는 분류 (필드값)옵션 제목이냐, 내용이냐, 제목+내용이냐
			query+=" where " +map.get("sercahField") +" like '%" +map.get("sercahWord")+"%'";
		}
		try {
			//쿼리문을싱행하기 위해 stmt객체생성
			stmt = con.createStatement();
			// 위에 세팅된쿼리문 실행후 rs객체의 결과값 저장
			rs = stmt.executeQuery(query);
			rs.next();
			// 현재행의지정된열의값을 리턴하는 메서드
			totalCount = rs.getInt(1);
			System.out.println("개시물 개수 추가 성공 ");
			
		} catch (Exception e) {
			
			System.out.println("게시물 개수 오류\n"+e.getMessage());
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	// 게시물 목록을 가져오는 메서드 BoardDTO받고 저장되어 있는 List 타입 리턴 메서드
	public List<BoardDTO> selectList(Map<String,Object>map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		//쿼리 문 세팅
		String query = "select * from board";
		//검색단어가 널이 아니면 쿼리문 실행하고
		if(map.get("sercahWord")!=null) {
			query+= " where " +map.get("sercahField")+" like '%" +map.get("sercahWord")+"%'";
		}
		// 아니면 내림차순 정멸
		query += " order by num desc";
		
		try {
			// 정적쿼리문으로 Statement 객체 생성
			stmt = con.createStatement();
			// if문을 걸리거나 그렇지 않은 쿼리문을가지고 실행한값을 rs에저장
			rs =stmt.executeQuery(query);
			//저장된 요소가지고 
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
	
	
	
	
	
}
