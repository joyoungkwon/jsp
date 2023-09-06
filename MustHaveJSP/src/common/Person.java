package common;

public class Person {
	// 자바빈즈 규약.
	// 필드나 멤버 변수는 private 선언
	private String name;
	private int age;
	// 반드시 기본 생성자 생성
	public Person() {
		
	}
	public Person(String name,int age) {
		this.name = name;
		this.age = age;
	}
	
	// getter setter 메소드 반드시 필요
	// 메소드는 public
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
