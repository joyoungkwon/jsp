package utils;
import javax.servlet.jsp.JspWriter;
public class OutPrint {

	
	public static void outprint(String msg, String url, JspWriter writer ) {
		try {
			String script= ""
					+"<script>"
					+ "console.log('"+msg+"');"
					+"</script>";
		} catch (Exception e) {e.getMessage();}
	}
}
