<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.conan.vo.Products.Products"%>
<%@ page import="com.conan.servlet.servletProductList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	out.println("하이");
	%>
	<jsp:include page="menu.jsp" flush="false" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세정보</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- <b><image src="/upload." ></b> -->
				<img src="upload/${item.fileName}"width="480" />
				 <img src="./upload/${item.fileName}"width="480" /> 
				 <img src="<%=request.getContextPath()%>/upload/${item.fileName}"width="480" />
			</div>
			<div class="col-md-6">
				<p>
				<h3>${item.proName }</h3>
				<b>${item.description }</b><br> <b>상품코드 :</b><span
					class="badge badge-danger">${item.proId }</span><br> <b>제조사
					: ${item.manufacturer }</b> <br> <b>분류 : ${item.proId }</b><br>
				<b>재고 수 : ${item.noOfStock }</b> <br>
				<h3>${item.unitPrice }원</h3>

				<form name="addForm" action="servletAddCart?target=${item.proId }" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
					<a href="cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="productList" class="btn btn-secondary">상품목록 &raquo;</a>	<!-- list를 servlet에서 시작하니까 productList로! -->
				</form>
				
				<script type="text/javascript">
					function addToCart(){
						if(confirm("상품을 장바구니에 추가하겠습니까?")){
							document.addForm.submit();
						}else{document.addForm.reset();}
					}
				</script>
			</div>

		</div>


	</div>
	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>