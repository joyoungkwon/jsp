package fileupload;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class MyfileDAO extends JDBConnect{ //오라클 디벨로퍼 상속
	
	
	
	public MyfileDAO() { // 생성자로 호출 super()
		super();
	}
	
	
	public int insertFile(MyfileDTO dto) { // int 타입 리턴메서드 추가되는 행은 result의 추가행 이 int타입반환
		int applyResult =0;
		
		
		
		try {
			String query="insert into myfile values (seq_board_num.nextval,?,?,?,?,?,default)"; // insert구문
			psmt = con.prepareStatement(query); // 쿼리 
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
			
			
		} catch (Exception e) {System.out.println("파일 추가 오류발생"+e.getMessage()); e.printStackTrace();}
		
		
		return applyResult;
	}
	
	public List<MyfileDTO> myFileList(){
		List<MyfileDTO> flieList = new Vector<MyfileDTO>();
		
		String sql = "select * from myfile order by idx desc";
		
		try {
			psmt =con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdex(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				
				flieList.add(dto);
				
			}
			System.out.println("검색성공");
			
		} catch (Exception e) {System.out.println("검색실패"+e.getMessage()); e.printStackTrace();}
		
		return flieList;
	}
}
