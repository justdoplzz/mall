<%@page import="com.mysql.cj.x.protobuf.MysqlxConnection.Close"%>
<%@page
	import="org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	try {
		// 1. JNDI 서버 객체 생성
		InitialContext ic = new InitialContext();
		// 2.lookup()
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		// 3. getConnection()
		conn = ds.getConnection();

		String sql = "select * from Members2 where userId=? and userPwd=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("userId"));
		pstmt.setString(2, request.getParameter("userPwd"));

		ResultSet  rs = pstmt.executeQuery();
		if (rs.next() != false) { //출력한 열이 
			session.setAttribute("userId", request.getParameter("userId")); //세션에 받아온 userId 저장 	
			String msg = (String)session.getAttribute("userId") + "님 환영합니다"; 
			session.setAttribute("msg", msg);
			
			response.sendRedirect("resultMember.jsp");
		}else {
			response.sendRedirect("loginFrm.jsp");
		}

		conn.close(); pstmt.close(); rs.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	%>
</body>
</html>