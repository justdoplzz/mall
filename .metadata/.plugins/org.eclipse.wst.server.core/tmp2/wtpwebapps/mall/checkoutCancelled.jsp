<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	checkoutCancelled.jsp 주문취소
	<jsp:include page="menu.jsp" flush="false" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문취소</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>주문이 취소되었습니다</h1>
		</div>

		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="productList">상품목록</a></li>
			</ul>
		</div>
	</div>
</body>
</html>