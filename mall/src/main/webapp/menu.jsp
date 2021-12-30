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
	<nav class="navbar navbar-expand navbar-dark bg-dark">
			<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="${contextPath}/index.jsp">HOME</a>
			</div>

			<div>
				<ul class="navbar-nav mr-auto">
					<!-- switch-case문 느낌임 -->
					<c:choose>
						<c:when test="${empty userId }"><!-- 세션userId가 비어있다면(받은게없다) -->
							<li class="nav-item"><a class="nav-link" href="${contextPath}/loginFrm.jsp">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/joinFrm.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>
								<li class="nav-item"><a class="nav-link" href="">${userId }님</a></li>
								<li class="nav-item"><a class="nav-link" href="${contextPath}/logoutProc.jsp">로그아웃</a></li>
							<form name="updateMem" action="${contextPath}/updateFrm.jsp">
								<li class="nav-item"><a class="nav-link" href="#" onclick="update()">회원수정</a></li>
							</form>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

			<div>
				<ul class="navbar-nav mr-auto"> 
					<li class="nav-item"><a class="nav-link" href="${contextPath}/productList">상품목록</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">상품등록</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/deleteProduct.jsp">상품삭제</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/board/listProc.do">게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>

   <jsp:include page="footer.jsp"/>
   
   <script type="text/javascript">	
 		function update(){
	if(confirm("회원정보 수정하시겠습니까?")){
		document.updateMem.submit();
	}else{document.updateMem.reset();}
	}
 		
	</script>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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

	 	<nav class="navbar navbar-espand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">HOME</a>
			</div>
			
			  <c:set var="contextPath" value="<%=request.getContextPath() %>"></c:set>
			<div>
				<ul class="navbar-nav mr-auto">			  	  	
				
				<!-- switch-case문 느낌임 -->
				  	<c:choose>
					 	<c:when test="${empty userId }"> <!-- 세션userId가 비어있다면(받은게없다) -->
							<li class="nav-item"><a class="nav-link" href="${contextPath}/loginFrm.jsp">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/joinFrm.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>							
							<li class="nav-item">${userId }님</li>
							<li class="nav-item"><a class="nav-link" href="${contextPath }/logoutProc.jsp">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath }/logoutProc.jsp">회원수정</a></li>			
						</c:otherwise>						
				</c:choose>  
				</ul>
			</div>


			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/productList">상품목록</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">상품등록</a></li>
					 <li class="nav-item"><a class="nav-link" href="${contextPath}/deleteProduct.jsp">상품삭제</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">HOME</a>
			</div>

			<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
			<div>
				
					<ul class="navbar-nav mr-auto"> 
						<li class="nav-item"><a class="nav-link" href="${contextPath}/ProductList">로그인</a></li> 
						<li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">회원가입</a></li>
					</ul>
			</div>
		

			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/ProductList">상품목록</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/addProduct.jsp">상품등록</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/deleteProduct.jsp">상품삭제</a></li>
				</ul>
			</div>
		</div>
	</nav>


</body>
</html> --%>