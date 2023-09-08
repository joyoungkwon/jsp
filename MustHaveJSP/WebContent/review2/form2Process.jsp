<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>파라미터 이름</td>
			<td>파라미터 값</td>
		</tr>
		<%
			request.setCharacterEncoding("utf-8");
			
			//Enumeration 열거형으로 할때 쓰는거.
			// requset 의 파라미터 형은 원래 열거형.
			// Enumeration을 구현한 pname의 메소드 호출
			Enumeration pNameS = request.getParameterNames();
			// hasMoereElements 는 루프 속에서 더 찾을 요소가 없는지를 검색 하는 메소드며
			while(pNameS.hasMoreElements()){
				//String pName의 (String)으로 강제 캐스팅한 pNameS.의 nextElement()로 다음요소를 검색한다
				// nextElenment는 다음요소가 있으면 그 값을 끌어다가 반환시킨다.
				// 
				String pName = (String)pNameS.nextElement();
				
				out.print("<tr><td>"+ pName+"</td>");
				String value = request.getParameter(pName);
				
				out.print("<td>"+value+"</td><tr>");
				// 배열로 선택값 끌어와서.
				String []hobby = request.getParameterValues(pName);
					// 저장할 변수 지정 하고.
					String value2 ="";
					// 포문 돌려서. 따온 문자열을 hobby로 받고.
					for(String str : hobby){
						// 저장할 변수의 따온 벨류값 str 문자열과 띄어쓰기를 더한 곳에
						// 한번에 저장
						value2 += str+" ";
					}
					// 하고 출력
					out.print("<td>"+value2+"</td></tr>");
			}
			
			
		%>
	</table>
	
</body>
	
</html>