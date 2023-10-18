package utils;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
// 임포트 
import javax.servlet.jsp.JspWriter;

public class JSFuncton {
	// alertLocation 이라는 메소드 만듬 
	// maseege,url wirter 메세지 알람창을 띄운후 명시한 url으로 이동한다.메서드
	
	//
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
	
	public static void alertLocation(HttpServletResponse resp, String msg , String url) {
		try {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>" // 넣을 자바스크립트 코드
					+ " alert('"+msg+"');"
					+ " location.href ='"+url+"';"
					+ "</script>";
			writer.print(script);// 일단 자바스크립트 코드를 출력(검색)
			//하고 내가 넣고자 하는 객체의 저장하려는 용도일꺼 같음
		}catch(Exception e) {e.getMessage();}
	}
	
	public static void alertBack(HttpServletResponse resp,String msg) {
		try {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+"<script>" 
					+ " alert('"+msg+"'); "
					+ " history.back();"
					+ "</script>";
			writer.print(script);
			
		}catch(Exception e) {e.getMessage();}
	}
}
