<%@page
	import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	2joinProc<hr>

	<%
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");
String userName = request.getParameter("userName");
String phoneNo = request.getParameter("phoneNo");
String address = request.getParameter("address");
String email = request.getParameter("email");

if (userId.isEmpty() || userPwd.isEmpty() || userName.isEmpty() || phoneNo.isEmpty() || address.isEmpty()
		|| email.isEmpty()) {
	response.sendRedirect("joinFrm.jsp");
} else {

	Connection conn = null;
	PreparedStatement pstmt;
	try {
		// 1. JNDI 서버 객체 생성
		InitialContext ic = new InitialContext();
		// 2.lookup()
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		// 3. getConnection()
		conn = ds.getConnection();

		String sql = "insert into Members2(userId, userPwd, userName, phoneNo, address, email) values (?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setString(2, userPwd);
		pstmt.setString(3, userName);
		pstmt.setString(4, phoneNo);
		pstmt.setString(5, address);
		pstmt.setString(6, email);
		pstmt.executeUpdate();
		
		session.setAttribute("userId", request.getParameter("userId")); //세션에 받아온 userId 저장 	
		String msg = (String)session.getAttribute("userId")+"님 회원가입이 완료되었습니다~!";
		session.setAttribute("msg", msg);
		response.sendRedirect("resultMember.jsp");
		
	} catch (SQLException e) {e.printStackTrace();
	}finally{
		conn.close();
	}
}
%>


</body>
</html>