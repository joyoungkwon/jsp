<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Membership.*" %>
<%@ page import="common.*" %>
<%
	int pinteger2 = (Integer)(pageContext.getAttribute("pageIntegers"));
	String pString2 = (String)(pageContext.getAttribute("pageString").toString());
	Person nPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>

<ul>
	<li>Integer객체<%=pinteger2 %></li>
	<li>String 객체 <%=pString2 %></li>
	<li>Person객체 <%=nPerson2.getName() %></li>
</ul>

