package common;

public class Car {
	
	// 자바빈즈 규칙
	// 필드값. 멤버변수는 private
	// 기본 디폴트 생성자 하나 무조건적으로 필요
	// 게터세터 메서드 필수적생성
	// 메서드는 public으로 모두 접근이 가능해야 할것
	
	private String CarName;
	private int CarPrice;
	private String CarColor;
	
	public Car() {
		
	}
	
	public Car(String carName, int carPrice, String carColor) {
		CarName = carName;
		CarPrice = carPrice;
		CarColor = carColor;
	}

	public String getCarName() {
		return CarName;
	}

	public void setCarName(String carName) {
		CarName = carName;
	}

	public int getCarPrice() {
		return CarPrice;
	}

	public void setCarPrice(int carPrice) {
		CarPrice = carPrice;
	}

	public String getCarColor() {
		return CarColor;
	}

	public void setCarColor(String carColor) {
		CarColor = carColor;
	}
	
}
