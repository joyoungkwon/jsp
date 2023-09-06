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
	
		// request.getRequestDispatcher 로 받은 none 값을 가지고
		// if 조건식으로 none값의 어떤값이 대입됐을떄 출력
		String none= request.getParameter("none");
		if(none != null) out.print("좋아하는과일 x");
	%>
	<h1>좋아하는 과일을 선택하세요</h1>
	<!-- 폼으로 보낸다 choiceResult.jsp 로 post 방식으로  -->
	<!-- 메소드 종류에서는 위에 url 중에 표시가 되는 get 방식과 안보이는 식으로 이루어진 post방식으로 이루어져있음  -->
	<form action="choiceResult.jsp" method="post">
		<!-- 슬랙트 네임 지정해주기. 왜냐하면 choiceResult.jsp 에서 받을 이름값이 필요. -->
		<select name="a">
			<!-- 드롭박스 옵션 벨류 값의 사과 배 바나나 값을 저장. -->
			<option value="사과">사과</option>
			<option value="배">배</option>
			<option value="바나나">바나나</option>
			<option value="none">없음</option>
		</select>
		<!-- 슬랙트 태그 나와서 input 타입으로 보내기 버튼 만들기. submit방식 -->
		<input type="submit" value="보내기">
	</form>

</body>
</html>