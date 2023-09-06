package dto;

import java.util.ArrayList;

public class CarRepository {

	private ArrayList<Car> CarList = new ArrayList<Car>();
	
	
	public CarRepository() {
		Car car = new Car();
		Car car2 = new Car();
		Car car3 = new Car();
		
		car.setCarId("car1234");
		car.setCarName("아우디");
		car.setColor("white");
		car.setCompany("아우디");
		car.setCost(100); // int 
		
		car2.setCarId("car1235");
		car2.setCarName("벤츠");
		car2.setColor("gray");
		car2.setCompany("메르세데스벤츠");
		car2.setCost(200); // int 
		
		car3.setCarId("car1236");
		car3.setCarName("BMW");
		car3.setColor("white");
		car3.setCompany("BMW KOREA");
		car3.setCost(300); // int 
		
		
		CarList.add(car);
		CarList.add(car2);
		CarList.add(car3);
		
	}
	
	// 전채 검색 메서드
	public ArrayList<Car> CarListAll(){
		return CarList;
	}
	
	// 전체 검색해서 같은 값 가져와서 id로 비교해서 가져오는거 arraylist 랑 if조건문 필요
	
	public Car CarbyId(String CarId) {
		Car car = null;
		for(int i= 0; i<CarList.size(); i++) {
			Car car2 = CarList.get(i);
			if(car2.getCarId().equals(CarId)) {
				car =car2;
			}
		}
		
		return car;
	}
	
}
