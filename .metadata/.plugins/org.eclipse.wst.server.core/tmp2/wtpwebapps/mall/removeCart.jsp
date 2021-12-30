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
삭제할거야?
<jsp:include page="menu.jsp" flush="false" />
<%
ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");

Products orderdItem = new Products();	//주문상품
for (int i = 0; i < cartList.size(); i++) {
	orderdItem = cartList.get(i);	
	if(orderdItem.getProId().equals(request.getParameter("target"))) {
		cartList.remove(i);
	}
}
response.sendRedirect("cart.jsp");

%>

<a href="cart.jsp" class="btn btn-secondary">장바구니</a>

</body>
</html>