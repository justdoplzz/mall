<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.conan.vo.Products.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
전체 삭제 할꺼야
	<%
ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
cartList.clear();
response.sendRedirect("cart.jsp");
%>

</body>
</html>