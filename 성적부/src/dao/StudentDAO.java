package dao;

import java.util.ArrayList;
import java.util.List;

import db.MysqlCon;
import dto.StudentDTO;

public class StudentDAO extends MysqlCon {
	
	public StudentDAO() {
		super();
	}

	
	public List<StudentDTO> selectAvg(String grade) {
		List<StudentDTO> studentList = new ArrayList<StudentDTO>();
		
		String query = "select * from 시험";
		if(grade != null && grade != "") { // grade가 null 값이 아니면서 동시에 빈 문자열도 아닐때.(값이있을때)
			query += " where 학점 = '" + grade + "'";
		}
		//(빈문자열일땐 select * from 시험 을 검색 한 결과를 rs에 담)
		
			
		 try {
			stmt = con.createStatement();
			
			
			rs = stmt.executeQuery(query);
			 
			 while(rs.next()) {
				 StudentDTO dto = new StudentDTO();
				 dto.setStudentId(rs.getString(1));
				 dto.setKor(rs.getInt(2));
				 dto.setEng(rs.getInt(3));
				 dto.setMat(rs.getInt(4));
				 dto.setGrade(rs.getString(5));
				 
				 studentList.add(dto);
			 }
			
			 System.out.println("시험성적 검색 성공");
			
		} catch (Exception e) {System.out.println("검색실패"+e.getMessage()); e.printStackTrace();}
		
		return studentList;
	}
	
	
}
