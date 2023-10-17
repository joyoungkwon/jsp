package model2.mvcBoard;

import java.util.*;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {

	public MVCBoardDAO() {
		super();
	}

	// int 리턴 하는 메서드 타입 파라미터 값으로 스트링 키로 object를 찾는 맵이 들어감.
	public int selectCount(Map<String, Object> map) {
		// 리턴 시킬 totalcount
		int totalCount = 0;
		// 세팅할 쿼리구문 = select count(*)form board = 보드라는 테이블에서 행의 갯수를 새는 함수 count(*)
		String query = "select count(*) from mvcboard";
		System.out.println("성공");
		// list에 html table 에서 설정한 sercahWord 라는 검색박스에 벨류값이 공백이거나 null 이 아니라면,
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}
		try {
			// 위에 쿼리를 실행하기위한 정적쿼리문을 생성하고.
			stmt = con.createStatement();
			// result의 객체 rs의 qeury실행 결과를 올린다.
			rs = stmt.executeQuery(query);
			// 총 있는 행의 갯수를 6줄을 새고 -> 6 이라고 반환 하기 때문에 하나만 읽어도 됌.
			// 맨처음에 커서 위치가 아무것도 지정해 있지 않기때문에 next로 넘겨 총 행의 갯수를 리턴한,
			// rs의 값을 읽어들이기위해 커서를 지정하고.
			rs.next();
			// 결과값을 샌 6의 값은 int타입으로 반환 시키기 때문에 리턴할 totalCount에 rs.getInt(1)첫번째
			// 칼럼값을 가져와 저장시키고.
			// 게시물의 개수를 총 리턴한다.
			totalCount = rs.getInt(1);
			System.out.println(totalCount);
			System.out.println("개시물 개수 검색 성공 ");

		} catch (Exception e) {

			System.out.println("게시물 개수 오류\n" + e.getMessage());
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<MVCBoardDTO> selectList(Map<String, Object> map) {
		List<MVCBoardDTO> bbs = new Vector<MVCBoardDTO>();
		String query = "select * from ( select Tb.*, rownum rNum from (select * from mvcboard ";
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}
		query += " order by idx desc ) Tb ) where rNum between ? and ?";
		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				bbs.add(dto);

			}
			System.out.println("게시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패\n" + e.getMessage());
			e.printStackTrace();
		}
		return bbs;
	}

	/*
	 * public int insertWrite(MVCBoardDTO dto) { int result =0; try {
	 * 
	 * String query
	 * =" insert into mvcboard(num,title,content,id,visitcount) values(seq_board_num.NEXTVAL,?,?,?,0)"
	 * ; psmt = con.prepareStatement(query); psmt.setString(1, dto.getTitle());
	 * psmt.setString(2, dto.getContent()); result = psmt.executeUpdate();
	 * 
	 * System.out.println("게시물 추가 성공");
	 * 
	 * } catch (Exception e) { System.out.println("게시물 추가 실패"+e.getMessage());
	 * e.printStackTrace(); }
	 * 
	 * return result; } public MVCBoardDTO selectView(String num) { MVCBoardDTO dto
	 * = new MVCBoardDTO();
	 * 
	 * String query= "select B.*,M.name" + " from member M" +
	 * " inner join mvcboard B " + "on M.id=B.id" + " where idx=?";
	 * 
	 * try { psmt = con.prepareStatement(query); psmt.setString(1, num);
	 * 
	 * rs = psmt.executeQuery();
	 * 
	 * System.out.println("성공");
	 * 
	 * if(rs.next()) { dto.setTitle(rs.getString(2));
	 * dto.setContent(rs.getString(3)); dto.setPostdate(rs.getDate(5));
	 * dto.setVisitcount(rs.getInt(6)); dto.setName(rs.getString(7)); }
	 * 
	 * } catch (Exception e) { System.out.println("실패"+e.getMessage());
	 * e.printStackTrace(); } return dto; }
	 * 
	 * 
	 * public void updateVisitCount(String num) {
	 * 
	 * 
	 * 
	 * String qeury="update mvcboard SET visitcount=visitcount+1 where idx=?";
	 * 
	 * 
	 * try { psmt = con.prepareStatement(qeury); psmt.setString(1, num);
	 * 
	 * rs = psmt.executeQuery();
	 * 
	 * 
	 * System.out.println("게시물\t조회\t증가성공"); } catch (Exception e) {
	 * System.out.println("게시물 조회 증가실패"); } }
	 * 
	 * public int UpdateEdit(MVCBoardDTO dto) { int result =0; String sql
	 * ="update mvcboard set title=?,content=? where idx=?";
	 * 
	 * try { psmt =con.prepareStatement(sql);
	 * 
	 * psmt.setString(1, dto.getTitle()); psmt.setString(2, dto.getContent());
	 * 
	 * result = psmt.executeUpdate();
	 * 
	 * System.out.println("게시물 수정 성공"); } catch (Exception e) {
	 * System.out.println("게시물 수정 실패 \n"+e.getMessage()); e.printStackTrace(); }
	 * return result;
	 * 
	 * }
	 * 
	 * 
	 * 
	 * public int deletePost(MVCBoardDTO dto) { int result =0; String qery
	 * ="delete from mvcboard where idx=?"; try { psmt =con.prepareStatement(qery);
	 * 
	 * result =psmt.executeUpdate(); System.out.println("삭제성공"); }catch (Exception
	 * e) { System.out.println("삭제실패\n"+e.getMessage()); e.printStackTrace(); }
	 * return result; }
	 * 
	 */

}
