<%@page
	import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1joinFrm
<jsp:include page="menu.jsp" flush="false" />

		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">회원가입</h1>
			</div>
		</div>

	<form action="joinProc.jsp" method="POST">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId"></td>
			</tr>
			<tr>
			<td>비밀번호</td>
			<td><input type="text" name="userPwd"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="userName"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phoneNo"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td rowspan="2"><input type="submit" value="회원가입"/></td>
		</tr>

		</table>

	</form>
</body>
</html>