package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.BookinfoDTO;
import common.JDBConnect;

public class BookinfoDAO extends JDBConnect {

	
	public BookinfoDAO() {
		super();
	}
	
	
	public List<BookinfoDTO> selectBook(BookinfoDTO dto){
		List<BookinfoDTO> list = new ArrayList<BookinfoDTO>();
		
		String qeury ="select *from bookinfo";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(qeury);
			
			while(rs.next()) {
				BookinfoDTO dto2 = new BookinfoDTO();
				dto2.setBookid(rs.getString(1));
				dto2.setAuthor(rs.getString(2));
				dto2.setBooktitle(rs.getString(3));
				dto2.setBookcontent(rs.getString(4));
				dto2.setBookprice(rs.getInt(5));
				dto2.setBookdate(rs.getString(6));
				dto2.setMemberid(rs.getString(7));
				
				list.add(dto2);
				
			}
			System.out.println("검색성공");
			
		} catch (Exception e) {System.out.println("검색실패"+e.getMessage());}
		
		return list;
	}
	public BookinfoDTO selectView(String id) {
		BookinfoDTO dto = new BookinfoDTO();
		String qeury ="select *from bookinfo where bookid=?";
		
		try {
			psmt = con. prepareStatement(qeury);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			rs.next();
			
			if(rs!=null) {
				dto.setBookid(rs.getString(1));
				dto.setAuthor(rs.getString(2));
				dto.setBooktitle(rs.getString(3));
				dto.setBookcontent(rs.getString(4));
				dto.setBookprice(rs.getInt(4));
				dto.setBookdate(rs.getString(5));
				dto.setMemberid(rs.getString(6));
				
			}
			System.out.println("상세정보 검색성공");
		} catch (Exception e) {
			System.out.println("상세정보 검색 실패\n"+e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
	public int insertbook(String id,String author,String title,String content,int price ,String date, String memberid) {
		int result = 0;
		
		String query="insert into bookinfo values(?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, author);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setInt(5, price);
			psmt.setString(6, date);
			psmt.setString(7, memberid);
			
			result = psmt.executeUpdate();
			
			System.out.println("도서 추가 성공");
		} catch (Exception e) {System.out.println("도서추가실패\n"+e.getMessage());}
		
		return result ;
	}
}
