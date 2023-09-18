<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--포워딩하는 페이지 위에설정함 ParamMain에서 포워드
set으로 설정한값을 get으로 받아옴, jsp:param으로 묶어서 보낸값은
request.getParameter("param1")식으로받아옴
 --%>
 <%--   ParamMain에서 설정한값을 포워드로 현페이지인paramfoward로 넘긴후 뿌려주는 html코드에
 		표현식을이용하여 실행한후 jsp액션태그특징상 만나는 부분에서 실행되는 부분이 적용되어, include할 페이지에
 		넘긴후 ParamInclude 페이지에서 표현식으로 뿌려주는 코드실행.
 		핵심:<jsp:include>태그안에서도 <jsp:param> 태그를 써서 값과 벨류를 설정할수 있고 
 		request영역이기떄문에 받을때 request.getParmeter()메서드를 써서 jsp액션태그인 param 매개변수값 을 
 		받을 수 있다.
  --%>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	<ul>
		<li><jsp:getProperty property="name" name="person"/>  </li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
		<li>본명: <%=request.getParameter("param1") %></li>
		<li>출생: <%=request.getParameter("param2") %></li>
		<li>특징: <%=request.getParameter("param3") %></li>
	</ul>
	
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="강원도영월" name="loc1"/>
		<jsp:param value="김삿갓면" name="loc2"/>
	</jsp:include>
</body>
</html>