<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--request영역으로 설정한 jsp:useBean 값을 request.getParamerer로 받아올수 있음
    	상황에따라 표현식으론 이렇게 스트립틀립을 써서 선언하고 뿌릴수도 있음 (강제캐스팅 경우)
     --%>
     
     
     
	<%= request.getParameter("loc1")  %>에
	<%= request.getParameter("loc2")  %> 이 있습니다.