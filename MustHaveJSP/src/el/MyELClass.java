package el;

public class MyELClass {
	public String  getGender (String jumin) {
		
		String returnStr ="";
		// ex ) 주민번호 특성상 000422-3665512일때 "-"문자열뒤에+1로 3자리를끌어옴
		int beginIdx = jumin.indexOf("-")+1;
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		
		int genderInt = Integer.parseInt(genderStr);
		
		if(genderInt ==1 || genderInt==3 ) {
			returnStr="남자";
		}else if(genderInt ==2 || genderInt == 4){
			returnStr="여자";
		}else {
			returnStr="사람이아니무니다";
		}
		
		return returnStr;
	}
//	public static boolean isNumber(String value) {
//		char[] chArr =value.toCharArray();
//		
//		
//	}
	
	public String getEmail(String email) {
		String emailStr ="";
		int beginEmail = email.indexOf("@");
		
		emailStr = email.substring(0, beginEmail);
		
//		if(subEmail.equalsIgnoreCase("d")) {
//			emailStr="다음";
//		}else if(subEmail.equalsIgnoreCase("n")) {
//			emailStr="네이버";
//		}else if(subEmail.equalsIgnoreCase("g")) {
//			emailStr="구글";
//		}
//		return emailStr;
//		
//	}
		
		return emailStr ;
	}
	
	public String getDomain(String email) {
		String retrunDomain = "";
		
		int startdomain = email.indexOf("@")+1;
		String domain = email.substring(startdomain);
		
		retrunDomain = domain;
		
		return retrunDomain;
	}
}
