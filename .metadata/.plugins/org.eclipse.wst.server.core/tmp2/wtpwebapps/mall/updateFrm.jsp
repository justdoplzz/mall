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
	<%
	String url = "jdbc:mysql://localhost:3306/scottDB?useSSL=false&&allowPublicKeyRetrieval=true";
	String dbId = "scott", dbPwd = "tiger";
	Connection conn = null;
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, dbId, dbPwd);
		

		sql = "select* from Members2 where userId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userId").toString());
		rs = pstmt.executeQuery();
		rs.next();
	%>
	<form action="updateProc" method="POST">
		<table border="1">

			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId"
					value="<%=rs.getString(1)%>" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="userPwd"
					value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"
					value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phoneNo"
					value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"
					value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<td rowspan="2"><input type="submit" value="수정하기" /></td>
			</tr>

		</table>
	</form>
	
	<%
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	} catch (SQLException e) {

	e.printStackTrace();
	}
	%>
	
</body>
</html>