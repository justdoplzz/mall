package com.conan.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.conan.vo.Products.Products;

/**
 * Servlet implementation class productList
 */
@WebServlet("/productList")
public class servletProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servletProductList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// 1. JNDI 서버 객체 생성
			InitialContext ic = new InitialContext();
			// 2.lookup()
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			// 3. getConnection()
			Connection conn = ds.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select*from products"); //db에서 검색
			ResultSet rs = pstmt.executeQuery(); //결과를 쿼리에 저장
			
			ArrayList<Products> pl = new ArrayList<Products>(); //Products를 pl이라는 이름의 ArrayList로 저장
						
			while (rs.next()) { //rs.next:다음줄이 잇을때까지 계속 출력
				pl.add(new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8)));				
			}
			request.setAttribute("list", pl);	//생성해놓은 pl어레이리스트에 'list'라는name(이름)붙혀줌.
			
			RequestDispatcher rd = request.getRequestDispatcher("productList.jsp");	//클라이언트로부터 들어온 요청을 jsp로 넘겨줌.
			rd.forward(request, response);	//위에서 지정한 곳으로 제어를 넘겨줌.
		

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
