<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.util.*" %>
    <%@ page import="Membership.*" %>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// result에서 메인에서 설정한 어플리케이션 set 값을 get으로 불러올때 설정한 car 변수로 호출함
		
		Map<Integer,Car> maps = (Map<Integer,Car>)application.getAttribute("Car");
		// set이라는 오브젝트로 맨처음 맵에 설정한 인터져 타입으로 받음 keyset으로 mpa의 저장되어 있는 값을
		// carkey에 저장함
		Set<Integer> CarKey = maps.keySet();
		// Interger 로 받는 이터레이터 객체를 생성함. hasNext를 사용하기 위함
		Iterator<Integer> CarKeyIterator = CarKey.iterator();
		
		// 이터레이터를 구현한 변수의 이터레이터 해쉬 넥스트.메서드를 사용.
		while(CarKeyIterator.hasNext()){
			// 처음 설정한 인티져 타입으로 이터레이터 메소드 넥스트를 호출 해서 인티져 타입 key값의 저장시킴
			// 이터레티어의 넥스트는 다음 요소를 가져옴
			Integer key = CarKeyIterator.next();
			// Car 객체의 벨류의 maps안의 저장시켜놓은 key값을 리턴함.
			// 그러면 Car객체의 저장되어 있는 값을 위에 저장시킨 해쉬맵을 이용해서 키값으로 찾는거임
			Car CarValue = maps.get(key);
			// 그리고 찾아옴 car 의 겟 네임을
			out.print(CarValue.getCarName()+":");
			// car의 겟  가격을
			out.print(CarValue.getCarPrice()+"</br>");
		}
		
	
	%>
</body>
</html>