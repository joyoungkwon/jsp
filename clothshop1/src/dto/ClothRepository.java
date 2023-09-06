package dto;

import java.util.ArrayList;


public class ClothRepository {
	private ArrayList<Cloth> clothrepositoryList =new ArrayList<Cloth>();
	
	public  ClothRepository() {
		Cloth cloth =new Cloth();
		Cloth cloth2 =new Cloth();
		Cloth cloth3 =new Cloth();
		
		cloth.setClothId("a1234");
		cloth.setClohtName("마르디 메크르리");
		cloth.setClothCost(71500);;
		cloth.setClothSize(100);
		cloth.setClothColor("black");
		
		cloth2.setClothId("a1235");
		cloth2.setClohtName("그루부라임");
		cloth2.setClothCost(47200);;
		cloth2.setClothSize(100);
		cloth2.setClothColor("black");
		
		cloth3.setClothId("a1236");
		cloth3.setClohtName("라퍼지");
		cloth3.setClothCost(120000);;
		cloth3.setClothSize(100);
		cloth3.setClothColor("black");
		
		clothrepositoryList.add(cloth);
		clothrepositoryList.add(cloth2);
		clothrepositoryList.add(cloth3);
		
		
	}
	public ArrayList<Cloth> getAllList(){
		return clothrepositoryList;
	}
	
	public Cloth getClothById(String clothId) {
		Cloth cloth =null;
		for(int i =0; i<clothrepositoryList.size();i++) {
			Cloth clot = clothrepositoryList.get(i);
			if(clot.getClothId().equals(clothId)) {
				cloth=clot;
			}
		}
		return cloth;
	}
	
	
}
