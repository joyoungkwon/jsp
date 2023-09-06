package dto;

import java.util.ArrayList;

public class BookRepository {

	
	private ArrayList <Book> booklist = new ArrayList<Book>();
	
	public BookRepository() {
		
		Book comick =new Book();
		comick.setBookid("A110");
		comick.setBookName("마법천자문");
		comick.setBookPrice(12000);
		
		Book preview =new Book();
		preview.setBookid("B111");
		preview.setBookName("막귀도 알어먹는 시사상식");
		preview.setBookPrice(15000);
		
		
		Book magazine =new Book();
		magazine.setBookid("C112");
		magazine.setBookName("인테리어");
		magazine.setBookPrice(200000);
		
		
		
		booklist.add(comick);
		booklist.add(preview);
		booklist.add(magazine);
		
		
	}
	public ArrayList<Book> getListAll(){
		return booklist ;
	}
	
	
}
