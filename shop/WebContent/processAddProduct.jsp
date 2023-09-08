<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.*"%>


<% 
	request.setCharacterEncoding("utf-8");

	String productId = request.getParameter("productId");
	
	String pname = request.getParameter("pname");
	
	int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
	
	String description = request.getParameter("description");
	
	String maunfacturer = request.getParameter("maunfacturer");
	
	String category = request.getParameter("category");
	
	long unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));
	
	String condition = request.getParameter("condition");
	
	
	ProductRepository pr = new ProductRepository().getInstance();
	Product Pproduct = new Product();
	
	Pproduct.setProductId(productId);
	Pproduct.setPname(pname);
	Pproduct.setUnitPrice(unitPrice);
	Pproduct.setDescription(description);
	Pproduct.setMaunfacturer(maunfacturer);
	Pproduct.setCategory(category);
	Pproduct.setUnitsInStock(unitsInStock);
	Pproduct.setCondition(condition);
	
	pr.addProduct(Pproduct);
	
	response.sendRedirect("products.jsp");
	
%>





