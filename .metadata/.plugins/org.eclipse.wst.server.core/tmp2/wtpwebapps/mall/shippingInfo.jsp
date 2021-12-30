<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
shippingInfo.jsp
	<jsp:include page="menu.jsp" flush="false" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="shippingInfoProc.jsp" class="form-horizontal" method="post" >	<!-- 나중에 servlet으로 변경해보셈. -->
														<%-- <%=session.getId()%> --%>
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>"/>
			
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" id="shippingName" name="shippingName" class="form-control"><br>
				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input type="text" name="shippingDate" class="form-control"/>(yyyy/mm/dd)
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">국가</label>
				<div class="col-sm-3">
					<input type="text" id="shippingCountry" name="shippingCountry" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" id="shippingZipcode" name="shippingZipcode" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" id="shippingAddress" name="shippingAddress" class="form-control">
				</div>
			</div>
		
							
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<a href="cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary" role=button>이전</a>
				<input type="submit" class="btn btn-primary" value="등록"/>
				<a href="checkoutCancelled.jsp" class="btn btn-secondary" role="button" role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
	
	
	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>