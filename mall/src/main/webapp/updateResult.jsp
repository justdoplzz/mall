<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	if (session != null || session.getAttribute("userId") != null) { // 세션이 처음인지 기억된 id가 있는지
		out.println(session.getAttribute("userId") + "님 정보 수정이 정상적으로 되었습니다"); %>
		<br><a href="logoutProc.jsp">로그아웃</a>
		<a href="updateFrm.jsp">정보 수정</a>
	<% } else {
		out.println("로그인 상태가 아님");
	} %>
</body>
</html>