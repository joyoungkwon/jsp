<%@page import="utils.JSFuncton"%>
<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="oracle.net.aso.i"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String saveDirectory = application.getRealPath("/Uploads"); // 실제 저장 폴더 위치
		int maxPostSize = 1024 * 1000; //파일 최대 용량 1MB
		String encoding = "utf-8";
		
		try{
			MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String cateArray [] = mr.getParameterValues("cate");
			
			StringBuffer cateBuf = new StringBuffer();
			
			if(cateArray==null){
				cateBuf.append("선택없음"); // 문자열 이어붙히기
			}else{
				for(String s : cateArray){
					cateBuf.append(s+ ", "); // 문자열 이어붙히기
				}
			}
			String fileName = mr.getFilesystemName("attachedFile"); 
			// 업로드한 파일 이름 끌어오기 선택 하는 방식이 text가 아니라 file이니깐 mr.getFilesystemName
			
			String ext = fileName.substring(fileName.lastIndexOf(".")); // 확장자 (jpg)
			// 업로드한 파일이름에서 확장자를 빼옴 (ex 장동건 .jpg = .jpg)
			String now = new  SimpleDateFormat("yyyyMMdd_HmsS").format(new Date()); // 데이트 타입 시간과 초를 끌어오기
			
			String newFileName = now + ext; // 문자열 만들기 now = 날짜식 ex  20231012_4:32:23+ext = .jpg
			// 20231012_4:32.jpg
			
			
			File oldFile = new File(saveDirectory+File.separator + fileName); // file 의 new file(만들라는곳+file.separtor/+filename)
			
			File newFile = new File(saveDirectory+File.separator + newFileName); //File.separator 는 = /이름
			
			oldFile.renameTo(newFile);//이름변경
			
			
			MyfileDTO dto = new MyfileDTO();
			dto.setName(name);
			dto.setTitle(title);
			dto.setCate(cateBuf.toString());
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			MyfileDAO dao = new MyfileDAO();
			int resut = dao.insertFile(dto);
			
			dao.close();
			
			if(resut==1){
				JSFuncton.alertLocation("추가성공", "FileUploadMain.jsp", out);
			}else{
				JSFuncton.alertLocation("추가실패", "FileUploadMain.jsp", out);
			}
			
		}catch(Exception e){out.print("저장불가"+e.getMessage());e.printStackTrace();
			request.setAttribute("errorMessage", "파일업로드오류");
			request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
		}
		
		
	%>
	
	
</body>
</html>