<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String sel = request.getParameter("sel");
	String text = request.getParameter("text");

	if(text != null){
		Map<String,Object> searchMap = new HashMap<>();
		searchMap.put("sel", sel);
		searchMap.put("text", text);
		session.setAttribute("searchMap", searchMap);
	}
	
	response.sendRedirect("boardmain.jsp?pageNum=1");
%>