package DB;

import java.util.Date;

public class MemberShipDTO {
	
	private String id;
	
	private String pass;
	
	private String name;
	
	private String gender;
	
	private String birthday;
	
	private String email;
	
	private String phoneNum;
	
	private String adress;
	
	private Date regist_day;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public Date getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(Date regist_day) {
		this.regist_day = regist_day;
	}
	
	

}
