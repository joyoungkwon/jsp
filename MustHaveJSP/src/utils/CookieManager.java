package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CookieManager {

	// 정적필드로 아무데서나 호출 할수 있게 만듬 httpServletResopnse 는 자바스크립트 코드 자바 파일에서 호출 하기 위함
	
	
	// 쿠키를 만드는메서드 resonpse 쿠키의 이름과 벨류와 지속시간을 파라미터로 받고
	// 받은 파라미터 값으로 쿠키를 굽는 메서드
	// 마지막의 자바스크립트 구현한 resonpse 을 이용해 addCooke로 만든 쿠키 를 쿠키의 추가함.
	public static void makeCookie(HttpServletResponse resonpse , String cName, String cValue , int cTime) {
		Cookie cookie = new Cookie(cName,cValue); // 쿠키생성
		cookie.setPath("/"); // 쿠키 경로 설정
		cookie.setMaxAge(cTime); // 유지기간 설정
		resonpse.addCookie(cookie); // 응답객체의 쿠키 추가
	}
	
	// 쿠키 이름 가지고 저장 되어있는 같은 값의 이름을 포문을 이용해서 반복해서 비교해서 같은 값이 있을때
	// 벨류의 파라미터로 넘겨받은 값이랑 같으면 벨류에 리턴하는 메서드
	public static String readCookie(HttpServletRequest request, String cName) {
		// 쿠키 값의 공백을 넣고
		String cookiesValue ="";
		// 쿠키는 불러올떄 일반적으로 반복문을 이용함.
		// 쿠키타입의 배열을 생성하고 request로 만든 쿠키를 받아옴.
		Cookie [] cookies = request.getCookies();
		// 받아온 쿠키값이 null이 아니라 값이 있을때.
		if(cookies!=null) {
			// cookies의 값만큼 c객체를 만드는 포문을 돌림
			for(Cookie c : cookies) {
				// 포문의 저장되어있는 전체 쿠키 배열의 i번째 방마다 이름을 저장시키고
				String cookiesName = c.getName();
				// 저장된 값의 이름과 내가 찾고자 하는 쿠키 이름 값을 비교
				if(cookiesName.equals(cName)) {
					// 같으면 그 이름과 같은 이름의 쿠키의 값을 가져와서 value값의
					// 이름의 해당하는 값을 저장시키고 리턴함.
					cookiesValue =c.getValue();
				}
			}
		}
		return cookiesValue;
	}
	// 다시 만들어서 벨류값 초기화
	public static void deleteCookie(HttpServletResponse response, String cName) {
		// makeCookie 를 불러서 해당 이름의 쿠키value 를 ""로 , 유지시간을 0으로 리턴 시켜버림.
		makeCookie(response, cName, "", 0);
	}
	
}
