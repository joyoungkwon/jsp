<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	try {
	

	String saveDirectory = application.getRealPath("/resources/images");
	int maxPostSize = 1024 * 1000 * 5; //5메가
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
			new DefaultFileRenamePolicy());
	
	String productId = mr.getParameter("productId");
	String pname = mr.getParameter("pname");
	int unitPrice = Integer.parseInt(mr.getParameter("unitPrice"));
	String description = mr.getParameter("description");
	String manufacturer = mr.getParameter("manufacturer");
	String category = mr.getParameter("category");
	long unitsInStock = Long.parseLong(mr.getParameter("unitsInStock"));
	String condition = mr.getParameter("condition");
	String Image = mr.getFilesystemName("Image");
	
	File photoFile = new File(saveDirectory+File.separator+Image); // 실제파일 업로드 파일 생성.
	

	ProductRepository pr = new ProductRepository();
	Product newProduct = new Product();

	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(unitPrice);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(unitsInStock);
	newProduct.setCondition(condition);
	newProduct.setProductImage(Image);

	pr.addProduct(newProduct);
	response.sendRedirect("products.jsp");

} catch (Exception e) {
	out.print("추가실패");
}
%>