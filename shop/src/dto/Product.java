package dto;

import java.io.Serializable;

	// interface Serializable- 직렬화
public class Product implements Serializable {
	// serialVersionUID - 고유 아이디 설정
	private static final long serialVersionUID =1L;

	private String productId; // 상품 아이디
	private String pname; //상품명
	private int unitPrice; // 상품 가격
	private String description; // 상품설명
	private String maunfacturer; // 제조회사 
	private String category;	// 상품분류
	private long unitsInStock;	// 상품 재고 개수
	private String condition;	// 상품상태(신상,중고,재생)
	
	// default생성자
	public Product() {
		
	}
	// 파라미터값 생성자 id,이름,가격
	public Product(String productId, String pname, int unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	// get,set 메서드
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMaunfacturer() {
		return maunfacturer;
	}
	public void setMaunfacturer(String maunfacturer) {
		this.maunfacturer = maunfacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
}
