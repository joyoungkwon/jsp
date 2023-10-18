package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	
	
	public static MultipartRequest uploadFile(HttpServletRequest req , String saveDirectory, int maxPostSize) {
		try {
			System.out.println("FileUtil.java파일 업로드성공");
			return new MultipartRequest(req, saveDirectory,maxPostSize,"utf-8");
			
		} catch (Exception e) {
			System.out.println("FileUtil.java파일 업로드실패");
			e.getMessage();
			e.printStackTrace();
			return null;
		}
		
	
	}
	
	
	
	public static void download(HttpServletRequest req , HttpServletResponse resp, String saveDirectory,
			String sfileName, String ofileName) {
		
		String sDirectory = req.getServletContext().getRealPath(saveDirectory);
			
		try {
			
			File file = new File(sDirectory, sfileName);
			
			
			InputStream iStream = new FileInputStream(file); 
			// 입출력 스트림 생성 *파일형식의
			
			
			String client = req.getHeader("User-Agent"); // 사용자에 따른 브라우저 정보를 끌어옴
			
			if(client.indexOf("WOW64")== -1){
				ofileName = new String(ofileName.getBytes("utf-8"),"150=8859-1");
				
			}else{
				ofileName = new String (ofileName.getBytes("KSC5601"),"ISO-8859-1");
			}
			
			resp.reset();
			resp.setContentType("application/octet-stream");
			
			resp.setHeader("Content-Disposition", "attachment; filename=\""+ofileName+"\"");
			
			resp.setHeader("Content-Length", ""+file.length());
			
			
			OutputStream outStream = resp.getOutputStream();
			
			
			byte b[] =new byte[(int)file.length()];
			int readBuffer =0;
			
			while((readBuffer = iStream.read(b))>0){
				outStream.write(b,0,readBuffer);
			}
			iStream.close();
			outStream.close();
			
			
		} catch (Exception e) {System.out.println("파일 다운로드중 예외 발생 "+e.getMessage());e.printStackTrace();}
		
		
	}
}
