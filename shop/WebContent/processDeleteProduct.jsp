<%@page import="common.JSFuncton"%>
<%@page import="dao.ProductRepository"%>
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
	String p_id  = request.getParameter("p_id");

	ProductRepository dao = new ProductRepository();
	
	
	String result = dao.deleteProduct(p_id);
	dao.close();
	
	if(result.equals("삭제성공")){
		JSFuncton.alertLocation("삭제되었습니다","products.jsp", out);
	}else{
		request.getRequestDispatcher("deleteProduct.jsp?error=1").forward(request, response);
	}

%>


</body>
</html>