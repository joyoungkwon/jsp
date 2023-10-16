<%@page import="utils.JSFuncton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>


<%

	String saveDirectory = application.getRealPath("/Uploads"); 
	String saveFilename  = request.getParameter("sName");
	String originalFilename  = request.getParameter("oName");
	
	
	try{
		File file = new File(saveDirectory,saveFilename); // 파일을 다운롣 받는 file 세이브 디렉토리 저장공간과 
		// 다운 받을 파일명
		
		InputStream inStrem = new FileInputStream(file); // 입력 스트림 생성
		
		String client = request.getHeader("User-Agent"); // 사용자에 따른 브라우저 정보를 끌어옴
		
		if(client.indexOf("WOW64")==-1){
			originalFilename = new String(originalFilename.getBytes("utf-8"),"150=8859-1");
			// 브라우저가 인터넷 익스를로러가 아니면 utf-8;
			// 인터넷 익스플로러면 ksc5601방식으로 한글처리
		}else{
			originalFilename = new String (originalFilename.getBytes("KSC5601"),"ISO-8859-1");
		}
		// 파일 다운로드용 응답헤더 설정
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\""+originalFilename+"\"");
		response.setHeader("Content-Length", ""+file.length());
		
		out.clear(); // 출력 스트림 초기화
		
		OutputStream outStream = response.getOutputStream();
		byte b[] =new byte[(int)file.length()];
		int readBuffer =0;
		
		while((readBuffer = inStrem.read(b))>0){
			outStream.write(b,0,readBuffer);
		}
		inStrem.close();
		outStream.close();
		
		
		
	}catch(Exception e){e.getMessage(); JSFuncton.alertBack("예외 발생", out);}

%>