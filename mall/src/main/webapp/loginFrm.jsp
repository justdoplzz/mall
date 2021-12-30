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
	로그인 폼이에유~<br/>
	<jsp:include page="menu.jsp" flush="false" />

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">로그인</h1>
			</div>
		</div>

	<form action="loginProc.jsp" method="POST">
		아이디 <input type="text" name="userId"><br/>
		비밀번호 <input type = "text" name="userPwd"><br/>
		<input type="submit" value="로그인">
	</form>
</body>
</html>