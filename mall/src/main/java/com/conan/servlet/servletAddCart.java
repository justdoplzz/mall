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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.conan.vo.Products.Products;
import com.mysql.cj.Session;

/**
 * Servlet implementation class sercletCart
 */
@WebServlet("/servletAddCart")
public class servletAddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletAddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//			String proId= request.getParameter("proId");
			// 1. JNDI 서버 객체 생성
			InitialContext ic = new InitialContext();
			// 2.lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			// 3. getConnection()
			Connection conn = ds.getConnection();
			
		
			//커넥션 풀을 이용하여 connection 얻어오는 과정
			PreparedStatement pstmt = conn.prepareStatement("select * from products where proId=?");
			pstmt.setString(1, request.getParameter("target"));
			ResultSet rs = pstmt.executeQuery();
			Products selectedItem = null;
			
			if(rs.next()) {	//selectedItem에 target으로 받은 정보들을 저장
				selectedItem = new Products(rs.getString(1),rs.getString(2),rs.getInt(3)
						,rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8));
			}
			
			HttpSession session = request.getSession();
			ArrayList<Products> cartList = (ArrayList<Products>)session.getAttribute("cartList");
			if(cartList == null) {//세션에 카트리스트가 없으면, 카트 리스트는 선택된 모든 아이템 저장
				cartList = new ArrayList<Products>();
				session.setAttribute("cartList", cartList);	//cartList에 저장
			}
			int cnt = 0;
			Products orderdItem = new Products();	//주문상품
			for (int i = 0; i < cartList.size(); i++) {
				orderdItem = cartList.get(i);	//세션에 추가된 상품을 주문 상품에 추가
				if(orderdItem.getProId().equals(request.getParameter("target"))) {
					cnt++;
					int orderedQuantity = orderdItem.getQuantity()+1;	//주문 수량 증가
					orderdItem.setQuantity(orderedQuantity);
				}
			}
			
			if(cnt == 0) {	//카트에 추가된 적이없으면
				selectedItem.setQuantity(1);	//최초 주문수량을 1로 설정
				cartList.add(selectedItem);	//카트리스트에 추가
			}
			//해당 상품의 상세 페이지로 			
			request.setAttribute("target", request.getParameter("target"));			
			
			RequestDispatcher rd = request.getRequestDispatcher("servletProductDetail");	
			rd.forward(request, response);	//위에서 지정한 곳으로 제어를 넘겨줌.
			
			rs.close();pstmt.close(); conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		
	}

}
