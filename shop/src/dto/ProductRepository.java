package dto;

import java.util.ArrayList;

public class ProductRepository {
	// Product 클래스를 받는 ArrayList < listOfProducts> 생성
	private ArrayList<Product> listOfProducts =new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	
	
	public ProductRepository() {
		
		Product phone =new Product("P1234","아이폰 14 프로맥스",1600000);
		phone.setDescription("6.7인치 OLED 디스플레이, 후면 카메라 3대 전면 카메라 1대");
		phone.setCategory("스마트폰");
		phone.setMaunfacturer("애플");
		phone.setUnitsInStock(1000);
		phone.setCondition("신상품");
		
		
		Product notebook=new Product("P1235","LG PC그램",20000000);
		notebook.setDescription("15.6인치 amoled디스플레이 i5 12세대 중고 노트북");
		notebook.setCategory("노트북");
		notebook.setMaunfacturer("LG");
		notebook.setUnitsInStock(30);
		notebook.setCondition("중고상품");
		
		
		Product tablet=new Product("P1236","삼성갤럭시탭",1100000);
		tablet.setDescription("12.4인치 amoled디스플레이 안드로이드13 ");
		tablet.setCategory("테블릿");
		tablet.setMaunfacturer("삼성");
		tablet.setUnitsInStock(100);
		tablet.setCondition("재생품");
		
		// ArrayList로 클래스 자체를 add로 저장
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	 // ArrayList의 product타입을 저장 시킨 모든 요소를 리턴하는 메서드 
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById =null;
		for(int i =0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if( product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		
		return productById;
	}
	
	//새로운 클래스 를 리스트에 저장하는 메소드
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
}
