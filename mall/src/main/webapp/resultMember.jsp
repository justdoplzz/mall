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
	<jsp:include page="menu.jsp"></jsp:include>
		
	
		<main role="main">
		<div class="container">
			<div class="text">
				
				${msg}
				
				<%-- <%
				if(session !=null|| session.getAttribute("userId") != null){
					out.println(session.getAttribute("userId")+"님 환영합니다");
				}else if(session !=null){
					out.println("로그인 상태가 아님");
				}
				%> --%>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>