package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBConnect;
import dto.BoardDTO;

public class BoardDAO extends JDBConnect{
	
	
	//기본생성자 호출로 데이터베이스 자동 연결 JDBConnect-> super로 끌어옴
	public BoardDAO () {
		super();
	}
	
	// 게시물의 개수 새기
	public int selectCount(Map<String, Object> map) {
		int result=0;
		
		String query ="select count(*) from board";
		if(map != null) {
			query+= " where "+map.get("sel") + " like '%" + map.get("text") + "%'";
		}
		try {
			// 결과가 하나밖에 나오지않기때문에 next 쓰기.
			stmt =  con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next(); // 게시물의 커서값을(한칸) 지정하기 (while)문없이 뽑아오기
			result =rs.getInt(1); // result의 한자리수를 뽑아오기 행 열을 int타입으로 하기때문에
			// int 타입 변수하나 필요
			
			System.out.println("게시물 전체 행갯수 조회성공");
		} catch (Exception e) {
			System.out.println("게시물 전체 행갯수 조회실패\n"+e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시물의 내용 가져오기 (모든내용) 리턴타입이 list 
	// list는 컬렉션프레임워크에 arrayList, vector linked 의 부모객체
	// 타입 햇갈리지 않기. 
	public List<BoardDTO>selectList(int start ,Map<String,Object> map){
		List<BoardDTO> dto = new ArrayList<>();
		
		String query="select * from board"; //board테이블 모든요소 끌어오기
		if(map != null) {
			query+= " where " + map.get("sel") + " like '%" + map.get("text")+ "%'";
		}
		query += " order by num desc";
		int limit =0;
		try {
			psmt =con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.absolute(start-1);
			
			
			while(rs.next()) { // rs의 다음요소가 없을떄까지도는 무한루프,
				BoardDTO dto2 = new BoardDTO(); // dto클래스의 하나당 선언해놓은 필드 값에 따라 rs에서 뽑아와서 대입시키기.
				dto2.setNum(rs.getString(1));
				dto2.setTitle(rs.getString(2));
				dto2.setContent(rs.getString(3));
				dto2.setId(rs.getString(4));
				dto2.setPostdate(rs.getDate(5));
				dto2.setVisitcount(rs.getInt(6)); // 마지막필드 6번까지 대입시키기.
				dto.add(dto2);
				limit++;
				
				if(limit==20) {
					break;
				}
				
			}
		
			System.out.println("게시물 검색성공");
		} catch (Exception e) {
			System.out.println("게시물 검색 실패\n"+e.getMessage());
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//글쓰기 메서드 추가하기
	// 파라미터가 반드시필요 (추가할 BoardDTO)
	public int insertWrite(BoardDTO dto) {
		int result =0;
		
		String query ="insert into Board (title,content,id) values (?,?,?)";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, dto.getTitle());
					psmt.setString(2, dto.getContent());
					psmt.setString(3, dto.getId());
					
					result = psmt.executeUpdate();
					
					
					System.out.println("게시물 글쓰기 성공");
				} catch (Exception e) {
					System.out.println("게시물 글쓰기 오류 \n"+e.getMessage());
					e.printStackTrace();
				}
		
		return result;
	}
	
	//조회수증가
	public int UpdateVisitCount(String num) {
		int result =0;
		String query = "update board set visitcount = visitcount+1 where num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);

			result = psmt.executeUpdate();
			
			System.out.println("방문자수증가성공");
		} catch (Exception e) {
			System.out.println("방문자수증가실패\n" + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	// 세부내용 출력 하기
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
			String query ="select board.*,member.name from board "
					+ "inner join member on board.id = member.id where num=?";
			// 검색한다 보드의 모든 테이블요소와 멤버테이블의 이름을, 
			// 검색하는 테이블은 보드와 멤버 테이블을 봤을때 id가 같은곳에서
			// num값이 내가 넣는 걸 
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setName(rs.getString("name"));
			}
			System.out.println("세부내용 검색성공");
			
		} catch (Exception e) {
			System.out.println("세부내용출력실패\n"+e.getMessage());
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	public void editBoard(BoardDTO dto) {
		String query ="update board set title=?,content=? where num=?";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			psmt.executeUpdate();
			
			System.out.println("업데이트성공");
		} catch (Exception e) {
			System.out.println("업데이트 실패");
			e.printStackTrace();
		}
		
		
	}
	
	public void deleteBoard(BoardDTO dto) {
		String query ="delete * from board where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			psmt.executeUpdate();
			
			System.out.println("삭제성공");
		} catch (Exception e) {
			System.out.println("삭제실패"+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	
}
