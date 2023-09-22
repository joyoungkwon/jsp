package dao;

import java.util.ArrayList;

import common.JDBConnect;
import dto.Product;

public class ProductRepository extends JDBConnect{
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	public ProductRepository() {
		super();
	}
	
	

	
	// 검색만할꺼라 void
	public void selectProduct(){
		//데이터베이스 안의 넣을 구문.
		String query ="select * from product";
		
		try {
			// con으로 내가 세팅해놓은 데이터베이스로 연동후, 그 연동한곳 안에 prepareStatement를
			// 생성하고 삽입하고자 하는 query구문을 넣음.
			// query구문의 뜻은, product의 모든 요소를 검색해라.
			psmt = con.prepareStatement(query);
			// resultSet객체의 psmt의 실행결과값을 저장 이때 결과값은
			// 검색결과 값 이 int타입으로 저장됌 3줄이 검색되었으면 int타입 (3) 이런식으로.
			// 결론적으로 resultSet안에 1줄2줄3줄이 있는거임
			rs = psmt.executeQuery();
			// 반복문 3줄가지고 하는거
			// 한줄씩 읽고 읽을때마다 product새로운 객체를 생성해서 겟셋 메서드를 이용해
			// 저장시킴. 이때 rs의 한줄을 읽어들이는 데 그때 getString으로 한 칼럼을 검색하고 그
			// 검색결과의 값을 가져와서 dto의 셋으로 저장시킴 while문으로 8개의 칼럼을 이어붙히고
			// 그 붙힌 모든값이 한줄로 다시 세팅이 되는거임 dto에, 그리고 마지막으로 저장시키고
			// 다시 요소가 있을시 읽어들이고 없을때까지 검색한결과로 한칼럼씩 뽑아와 한줄을 만들고, 
			// ArrayList의 추가 하는걸 요소가 없을떄까지 반복해서 저장함 *결국 listofProducts에
			// 내가설정한 sql구문으로 검색한 결과 값이 dto에 저장되었다가 listofProducts에 저장됌
			while(rs.next()) {
				Product dto = new Product();
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitPrice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setManufacturer(rs.getString(5));
				dto.setCategory(rs.getString(6));
				dto.setUnitPrice(rs.getInt(7));
				dto.setCondition(rs.getString(8));
				
				listOfProducts.add(dto);
				
			}
			System.out.println("검색성공");
			
		} catch (Exception e) {
			System.out.println("검색실패");
		}
		
		
	}
	
	
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if( product.getProductId().equals(productId) ) {
				productById = product;
				break;
			}
		}
		
		
		return productById;
		
	}
	
	//Product 의 저장되어있는 필드값을 가지고 추가 하고 추가되는 행을 결과값 int 으로 보려는 메서드.
	public int addProduct(Product product) {
		// return 시키고 결과값을 보려는 int타입 result
		int result=0;
		// insert into product values 라는 sql구문 product에 새로운 값을 집어넣는거
		String query ="insert into product values(?,?,?,?,?,?,?,?)";
		
		try {
			// psmt에 동적쿼리문을 생성할껀데, 내가 써놓은 query구문으로 연결할려고하는것
			psmt = con.prepareStatement(query);
			// 물음표 자리에 맞춰 index 자리에, product에 저장되어 있는 필드값을 get
			//으로 받아와 세팅하고
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getPname());
			psmt.setInt(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			// 실행 이때는 추가되는 행의 열이 검색 결과로 나오는게 아니라
			// 추가되는 몇줄이 추가되었는지 나오기때문에, int타입으로 받아들임
			result =psmt.executeUpdate();
			
			
			System.out.println("추가성공");
		} catch (Exception e) {
			System.out.println("추가실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String deleteProduct(String p_id) {
		 String result="";
		 String query ="delete from product where p_id=?";
		 
		 try {
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, p_id);
			 
			 psmt.executeUpdate();
			 result = "삭제성공";
			
			 System.out.println("삭제성공");
			 
		} catch (Exception e) {
			System.out.println("삭제실패");
			e.getMessage();
			e.printStackTrace();
		}
		 return result;
	}
	
}









