package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.BookinfoDTO;
import common.JDBConnect;

public class BookinfoDAO extends JDBConnect {

	// 생성자로 exetends 한 JDBConnect super()끌어와서 생성자 호출하면 연결.
	public BookinfoDAO() {
		super();
	}
	
	// 많은 데이터를 한클래스 dto로 쪼갠후 그 dto를 리스트로 저장하는 list리턴타입 검색메서드
	// 사용용도 - list형태의 저장되어있는 Bookinfodto를 하나의 클래스로 저장하고 받을때도
	// Bookinfodto 형태로 하나의 클래스로 받아 사용하기위함
	public List<BookinfoDTO> selectBook(BookinfoDTO dto){
		List<BookinfoDTO> list = new ArrayList<BookinfoDTO>();
		// bookinfo테이블의모든요소 검색
		String qeury ="select *from bookinfo";
		
		try {
			// 검색결과를 정적쿼리를 생성해
			// 정적쿼리 실행결과를 ResultSet에 담음.(추가작업 필요해서)
			stmt = con.createStatement();
			rs = stmt.executeQuery(qeury);
			
			while(rs.next()) { // ResultSet의 다음요소가 없을때까지
				BookinfoDTO dto2 = new BookinfoDTO(); // 새로운 dto에 하나씩 필드값을세팅해서 새로운 클래스를 만들고
				dto2.setBookid(rs.getString(1));
				dto2.setAuthor(rs.getString(2));
				dto2.setBooktitle(rs.getString(3));
				dto2.setBookcontent(rs.getString(4));
				dto2.setBookprice(rs.getInt(5));
				dto2.setBookdate(rs.getString(6));
				dto2.setMemberid(rs.getString(7));
				
				list.add(dto2);//그만든값을 ResultSet의 다음요소가 없을때까지 반복해서 list형태로 클래스자체로 넘기고 저장
				
			}
			System.out.println("검색성공");
			
		} catch (Exception e) {System.out.println("검색실패"+e.getMessage());}
		
		return list; // list타입리턴
	}
	
	// 파라미터값을 가지고 새로운 dto를 리턴하는 검색메서드
	// 사용할 용도는 상세보기 . 내가 <a>태그에 하이퍼링크 뒤에?표로 보낸 테이블의 고유 값으로
	// dto를 내가 넘긴 것만 나오게 하려고.
	public BookinfoDTO selectView(String id) {
		
		BookinfoDTO dto = new BookinfoDTO();
		// bookinfo의 모든 요소가 내가넘긴 파라미터값 bookid와 같은것만. 검색한다.
		String qeury ="select *from bookinfo where bookid=?";
		
		try {
			// 내가넣는값이있으니 동적쿼리로 내가 작성한쿼리문을 작성하고
			psmt = con. prepareStatement(qeury);
			// 첫번째 자리에 하이퍼링크로(href"view.jsp=?<%=dto2.getBookid() %>")로 받은 파라미터값을 대입하면
			psmt.setString(1, id);
			
			rs = psmt.executeQuery(); //rs에는 내가 넘긴 아이디값으로 검색한 결과값이 담기게되고, 고유 아이디니깐
			//하나만 담기게된다.
			rs.next(); //rs의 결과에는 커서값이지정되어있지않기때문에 next로 커서값을 지정하고,
			
			if(rs!=null) { // 결과리턴이하나이기때문에 반복문필요없이, null과 비교해서
				dto.setBookid(rs.getString(1)); // 새로운 dto에 rs의 결과칼럼을 가져다가 dto에 1번째 자리부터 7번째까지 대입하면
				dto.setAuthor(rs.getString(2));
				dto.setBooktitle(rs.getString(3));
				dto.setBookcontent(rs.getString(4));
				dto.setBookprice(rs.getInt(5));
				dto.setBookdate(rs.getString(6));
				dto.setMemberid(rs.getString(7)); // 모든 필드값이 갖춰진 새로운 dto가 리턴된다
				
			}
			System.out.println("상세정보 검색성공");
		} catch (Exception e) {
			System.out.println("상세정보 검색 실패\n"+e.getMessage());
			e.printStackTrace();
		}
		return dto;//최종적으로 dto를 리턴한다.
	}
	
	// int타입 insert메서드 파라미터값은 그냥 넘겨받았다, dto로 해도 무방
	// ex ) public int insertbook(BookinfoDTO dto)
	// int타입 리턴이유는 executeUpdate는 결과값이 행을추가하거나 삭제되는 값이 int타입으로 리턴되기 때문에
	// int타입 메서드로 선언을했다.
	public int insertbook(String id,String author,String title,String content,int price ,String date, String memberid) {
		int result = 0;
		// bookinfo에 추가하는 쿼리구문
		String query="insert into bookinfo values(?,?,?,?,?,?,?)";
		
		try {
			//받아온파라미터값으로 ?자리의 index에맞춰서 대입
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, author);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setInt(5, price);
			psmt.setString(6, date);
			psmt.setString(7, memberid);
			// int타입 result의 실행결과 넣기
			result = psmt.executeUpdate();
			
			System.out.println("도서 추가 성공");
		} catch (Exception e) {System.out.println("도서추가실패\n"+e.getMessage());}
		
		return result ; //리턴
	}
	public int deletebookinfo (String bookid) {
		int result =0;
		String qeury ="delete from bookinfo where bookid=?";
		
		try {
			psmt= con.prepareStatement(qeury);
			psmt.setString(1, bookid);
			result =psmt.executeUpdate();
			
			System.out.println("책내용삭제성공");
		} catch (Exception e) {
			System.out.println("책내용삭제실패"+e.getMessage());
			e.printStackTrace();
		}
	return result;
	}
}
