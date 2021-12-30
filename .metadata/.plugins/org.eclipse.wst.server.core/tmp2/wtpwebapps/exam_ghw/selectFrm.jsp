<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계좌 조회</h1>
<form action="selectFrm.action" method="post">
	계좌번호: <input type="text" name="accountId"><br>
	비밀번호: <input type="text" name="accountPwd"><br>
	<input type="submit" value="조회하기"/>
</form>


<table border="1">
	<tr>
		<td><b>Account ID</b></td>
		<td><b>Account Password</b></td>
		<td><b>User Name</b></td>
		<td><b>Balance</b></td>
	</tr>
	<tr>
		<td><b>${list.getAccountId }</b></td>
		<td><b>${list.setAccountPwd }</b></td>
		<td><b>${list.getUserName }</b></td>
		<td><b>${list.getBalance }</b></td>
	</tr>
</table>
		


</body>
</html>