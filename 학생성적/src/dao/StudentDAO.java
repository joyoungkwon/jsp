package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.MysqlCon;
import dto.StudentDTO;

public class StudentDAO extends MysqlCon {
	
	
	public StudentDAO() {
		super();
	}
	
	public StudentDTO selectStudentforluna() {
		StudentDTO dto = new StudentDTO();
		String qeury ="select 이름,대학생.학번,성별,국어,영어,수학 from 대학생 join 시험 on 대학생.학번=시험.학번 where 이름='루나'";
		//"select 이름,학번,성별 from 대학생 where='루나'"
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(qeury);
			
			rs.next();
			
			if(rs!=null) {
				dto.setName(rs.getString(1));
				dto.setStudentId(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setKor(rs.getInt(4));
				dto.setEng(rs.getInt(5));
				dto.setMat(rs.getInt(6));
			}
			
			System.out.println("루나 대꼬오기성공");
		} catch (Exception e) {System.out.println("루나못대꼬옴"+e.getMessage());}
		
		return dto;
		
	}
	public StudentDTO selectStudentDTO(String name) {
		StudentDTO dto = new StudentDTO();
		String sql ="select 이름,대학생.학번,성별,국어,영어,수학 from 대학생 join 시험 on 대학생.학번=시험.학번 where 이름=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			
			rs=psmt.executeQuery();
			
			rs.next();
			
			if(rs!=null) {
				dto.setName(rs.getString(1));
				dto.setStudentId(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setKor(rs.getInt(4));
				dto.setEng(rs.getInt(5));
				dto.setMat(rs.getInt(6));
			}
			
			System.out.println("검색성공");
		} catch (Exception e) {System.out.println("검색성공"+e.getMessage());}
		
		
		
		return dto;
	}
	
	public List<StudentDTO> studentlistall(){
		List<StudentDTO> dto = new ArrayList<StudentDTO>();
		String sql ="select 이름,대학생.학번,성별,국어,영어,수학 from 대학생 join 시험 on 대학생.학번=시험.학번";
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				StudentDTO dto2 = new StudentDTO();
				dto2.setName(rs.getString(1));
				dto2.setStudentId(rs.getString(2));
				dto2.setGender(rs.getString(3));
				dto2.setKor(rs.getInt(4));
				dto2.setEng(rs.getInt(5));
				dto2.setMat(rs.getInt(6));
				dto.add(dto2);
			}
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패"+e.getMessage());
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 대학생 테이블의 모든 요소를 끌어오는 메서드
	public List<StudentDTO> selectstudent ( Map<String, Object> map){
		List<StudentDTO> dto = new ArrayList<StudentDTO>();
		
		String sql = "select * from 대학생";
		if(map.get("searchhWord") != null) {
			System.out.println("성공");
			sql+=" where "+ map.get("searchField")+ " like '%"+map.get("searchhWord")+"%'";
		}
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				StudentDTO dto2 = new StudentDTO();
				dto2.setName(rs.getString(1));
				dto2.setStudentId(rs.getString(2));
				dto2.setGender(rs.getString(3));
				
				dto.add(dto2);
			}
			System.out.println("실행성공");
		} catch (Exception e) {
			System.out.println("실행실패"+e.getMessage());
		}
		return dto;
	}
}
