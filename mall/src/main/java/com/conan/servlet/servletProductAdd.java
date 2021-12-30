package com.conan.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class servletAdd
 */
@WebServlet("/servletProductAdd")
public class servletProductAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servletProductAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		// 파라미터 추출
//		String proId = request.getParameter("proId");
//		String proName = request.getParameter("proName");
//		String unitPrice = request.getParameter("unitPrice");
//		String description = request.getParameter("description");
//		String manufacturer = request.getParameter("manufacturer");
//		String category = request.getParameter("category");
//		String noOfStock = request.getParameter("noOfStock");
//		String fileName = request.getParameter("fileName");
//
//		
//
//		try {
//		// 1. JNDI 서버 객체 생성
//		InitialContext ic = new InitialContext();
//		// 2.lookup()
//		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
//		// 3. getConnection()
//		Connection conn = ds.getConnection();
//		
//		
//		PreparedStatement pstmt = conn.prepareStatement("insert into Products(proId,proName,unitPrice"
//								+ ",description,manufacturer,category,noOfStock,img) values(?,?,?,?,?,?,?,?)");
//	    pstmt.setString(1, proId );
//	    pstmt.setString(2, proName);
//	    pstmt.setInt(3, Integer.parseInt(unitPrice));
//	    pstmt.setString(4, description);
//	    pstmt.setString(5, manufacturer);
//	    pstmt.setString(6, category);
//	    pstmt.setInt(7, Integer.parseInt(noOfStock));
//	    pstmt.setString(8, fileName);
//	    pstmt.executeUpdate();
//
//		ResultSet rs = pstmt.executeQuery();
//		Products pl = null;
//		
//		if (rs.next()) {
//			pl=new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
//					rs.getString(6), rs.getInt(7), rs.getString(8));				
//		}
//		
//		request.setAttribute("item", pl);
//		RequestDispatcher rd = request.getRequestDispatcher("productDetail.jsp");
//		rd.forward(request, response);
//		
//		} catch (NamingException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
	
		try {
		// 1. JNDI 서버 객체 생성
		InitialContext ic = new InitialContext();
		// 2.lookup()
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		// 3. getConnection()
		Connection conn = ds.getConnection();
		
		
		request.setCharacterEncoding("UTF-8");		
		// 파라미터 추출  addProduct.jsp에서 enctype="multipart/form-data"으로 받기 때문에 request. 이 아닌multi로 함.
//		String proId = request.getParameter("proId");
//		String proName = request.getParameter("proName");
//		String unitPrice = request.getParameter("unitPrice");
//		String description = request.getParameter("description");
//		String manufacturer = request.getParameter("manufacturer");
//		String category = request.getParameter("category");
//		String noOfStock = request.getParameter("noOfStock");
//		String fileName = request.getParameter("fileName");
		
		
		ServletContext application = getServletContext();	
		String path = application.getRealPath("/upload");//파일이 저장될 위치
		int size = 1024 * 1024 * 10; //10M

		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String name = (String) files.nextElement();
		String orgFile = multi.getOriginalFileName(name);	//multi 이기 때문에 orgFile(원래형태)로받아옴
		
		//request.이 아닌 multi.으로 다 받아옴			
		String proId = multi.getParameter("proId");
		String proName = multi.getParameter("proName");
		Integer unitPrice = Integer.parseInt(multi.getParameter("unitPrice")) ;
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		Integer noOfStock = Integer.parseInt(multi.getParameter("noOfStock"));
		
//		String fileName = multi.getParameter("fileName");	//fileName을 orgFile로 받았기 때문에 이문장 사용안함.
		
		PreparedStatement pstmt = conn.prepareStatement("insert into Products values(?,?,?,?,?,?,?,?)");
	    pstmt.setString(1, proId );
	    pstmt.setString(2, proName);
	    pstmt.setInt(3, unitPrice);
	    pstmt.setString(4, description);
	    pstmt.setString(5, manufacturer);
	    pstmt.setString(6, category);
	    pstmt.setInt(7, noOfStock);
	    pstmt.setString(8, orgFile);	//fileName을 orgFile로 받아서 이렇게. 근데 get이 없는 이유는 type=file이라서 인듯.
	    pstmt.executeUpdate();


		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
