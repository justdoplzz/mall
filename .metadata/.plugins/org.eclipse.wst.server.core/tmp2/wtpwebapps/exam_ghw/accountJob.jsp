<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>은행 업무</h1>
<form action="accountjob.action" method="post">
	계좌번호: <input type="text" name="accountId"><br>
	비밀번호: <input type="text" name="accountPwd"><br>
	금액: <input type="text" name="userName">원<br>
	<select name="items" class="txt">
		<option value="send">송금</option>
		<option value="out">출금</option>
		<option value="in">입금</option>
	</select>
	수신인: <input type="text" name="send_accountId"><br>
	<input type="submit" value="실행하기"/>
	
</form>
</body>
</html>