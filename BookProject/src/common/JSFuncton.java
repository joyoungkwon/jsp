package common;
// 임포트 
import javax.servlet.jsp.JspWriter;

public class JSFuncton {
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
					+ "<script>" // 넣을 자바스크립트 코드
					+ " alert('"+msg+"');"
					+ " location.href ='"+url+"';"
					+ "</script>";
			out.println(script);// 일단 자바스크립트 코드를 출력(검색)
			//하고 내가 넣고자 하는 객체의 저장하려는 용도일꺼 같음
		}catch(Exception e) {e.getMessage();}
			
		
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+"<script>" 
					+ " alert('"+msg+"'); "
					+ " history.back();"
					+ "</script>";
			out.println(script);
			
		}catch(Exception e) {e.getMessage();}
		
		 
		
	}
	
}
