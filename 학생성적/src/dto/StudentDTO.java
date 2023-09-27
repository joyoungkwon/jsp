package dto;

public class StudentDTO {
	
	// 멤버 변수 선언
	// 대학생 테이블 요소
	private String name;
	private String studentId;
	private String gender;
	//시험 성적 테이블 요소
	private int kor;
	private int eng;
	private int mat;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	
	public int avg() {
		int avg =0;
		
		avg = Math.round((kor+eng+mat)/3);
		
		return avg;
	}
	
	
	
	public String point() {
		String str="";
		
		StudentDTO dto = new StudentDTO();
		
		int grade = avg();
		
		switch(grade/10) {
		
			case 9:
				str = "A";
				 break;
			case 8:
				str = "B";
				break;
			case 7:
				str = "C";
				break;
				
			default:
				str = "F";
				break;
		}
		
		return str;
	}
	
}
