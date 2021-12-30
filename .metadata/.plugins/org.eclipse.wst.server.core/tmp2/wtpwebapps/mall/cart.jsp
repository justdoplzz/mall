<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.conan.vo.Products.Products"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="java.lang.Exception"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" flush="false" />

	<div class="jumbotron">
		<div class="container">
			<div class="col-md-6">
				<h1 class="display-3">장바구니</h1>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<!-- cartId=session.getId() -->
					<!-- session -->
					<td align="left"><a	href="deleteCart.jsp?target=<%=session.getId()%>" class="btn btn-danger">전체 삭제하기</a></td>
					<td align="right"><a href="shippingInfo.jsp?cartId=<%=session.getId()%>"class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>

	<div style="padding-top: 50px">
		<table class="table table=hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>

			<%-- <form name="servletCList" action="servletCList?target=${item.proId }" method="post"" ></form> --%>

			<%
			//카트리스트에 저장된 제품들의 가격,수량,소계 등 출력
			int sum = 0;
			ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
			if (cartList != null) {
				for (Products product : cartList) {	//cartList에 있는 내용들을 product에 넣어라
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;
			%>
			<tr>
				<td><%=product.getProId()%>-<%=product.getProName()%></td>
				<td><%=product.getUnitPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=total%></td>
				<td><a href="removeCart.jsp?target=<%=product.getProId()%>"	class="badge badge-danger">삭제</a></td>
			</tr>

			<%
			}
			}
			%>

			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum%></th>
				<th></th>
			</tr>
			
			
		</table>
		
		
		<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<!-- cartId=session.getId() -->
					<td align="left"><a href="productList" class="btn btn-secondary">&laquo;쇼핑 계속하기</a><!-- servlet으로 보내줌 --></td>				
				</tr>
			</table>
		</div>
	</div>
		
	</div>


	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>