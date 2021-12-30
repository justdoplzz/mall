//2021.12.06 work2member 랑 짝꿍
package com.conan.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class ex11updateProc
 */
@WebServlet("/updateProc")
public class servletUpdateProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servletUpdateProc() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo");
		request.setCharacterEncoding("UTF-8");

		// 파라미터 추출
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phoneNo = request.getParameter("phoneNo");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		// DB연결
		
	

		try {
			// 1. JNDI 서버 객체 생성
			InitialContext ic = new InitialContext();
			// 2.lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			// 3. getConnection()
			Connection conn = ds.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select*from products");
			ResultSet rs = pstmt.executeQuery();
			
			String sql = null;

			sql = "update Members2 set  userPwd= ?, userName= ? ,phoneNo= ? ,address= ? ,email = ? where userId =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userName);
			pstmt.setString(3, phoneNo);
			pstmt.setString(4, address);
			pstmt.setString(5, email);
			pstmt.setString(6, userId);
			int i = pstmt.executeUpdate();
			if (i == 1) {
				response.sendRedirect("productList");
			} else {
				response.sendRedirect("updateFrm.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}