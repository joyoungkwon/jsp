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
		// out 내장객체 안의 buffer 
		//버퍼내용 삭제하기
		out.print("출력되지않은 텍스트"); // 버퍼에 저장
		out.clearBuffer(); // 버퍼 내용을 삭제 (출력을 하지않음)
		
		out.print("<h2>out 내장객체 </h2>");
		
		// 버퍼의 크기 buffersize
		out.print("출력 버퍼의 크기 :"+ out.getBufferSize() +"</br>");
		// 남은 버퍼의 크기 reamaining.
		out.print("남은 버퍼의 크기 :"+ out.getRemaining() +"</br>");
		
		// flush ()- 강제로 버퍼 내용 지우기 < 버퍼의 저장되어있는 값을 출력후 삭제>
		out.flush();
		
		out.print("flush 후 버퍼의 크기 :"+ out.getRemaining()+"</br>");
		
	
	
	%>
</body>
</html>