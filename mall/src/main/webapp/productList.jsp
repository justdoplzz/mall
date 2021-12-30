<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.conan.vo.Products.Products"%>
<%@ page import="com.conan.servlet.servletProductList"%>

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
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<c:forEach var="item" items="${list}"><!-- servlet에서 생성한 arraylist인 list를 item이라는 이름으로 사용하기위한 작업. -->
				<div class="col-md-6">
					<h3>${item.proName }</h3>
					<p>${item.description }</p>
					<p>${item.unitPrice }원</p>
					
					<%-- <p><fmt:formatNumber ${item.getUnitPrice()} pattern="#,###"/>원</p> --%>
					<p><img src="<%=request.getContextPath()%>/upload/${item.fileName}" width="480" /></p>
					<p><a href="servletProductDetail?target=${item.proId}"	class="btn btn-secondary" role="buttoln">상세정보 &raquo;</a></p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
<%-- <%=request.getContextPath()%> --%>