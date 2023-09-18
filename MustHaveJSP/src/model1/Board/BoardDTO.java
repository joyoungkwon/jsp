package model1.Board;

public class BoardDTO {

	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private  String visitcount;
	private String name; 
	// db의 board테이블에는 name이 없음.
	// db member 테이블 에 name이있음
	// 여기서 선언한 이유는 다른 테이블의 칼럼을 설정하기 위한용도.
	// 멤버테이블의 name을 끌어오기위해 
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
