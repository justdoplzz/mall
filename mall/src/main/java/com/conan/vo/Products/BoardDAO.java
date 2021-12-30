package com.conan.vo.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	//singleton
	private static BoardDAO dao = new BoardDAO();
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {	//BoardDAO를 사용하고 싶으면 getInstance()를 사용해야됨
											//BoardDAO vo = BoardDAO.getInstance(); 이렇게!
		return dao;
	}	
	PreparedStatement pstmt=null;
	Connection conn =null;
	ResultSet rs = null;
	
	//DB연결 객체 반환
	public Connection getConnection() {		
		Connection conn = null;
		try {
			// 1.JNDL 서버 객체 생성
			InitialContext ic = new InitialContext();
			// 2.Lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			// 3.getConnection()
			conn = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	//DB연결 닫기
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close(); pstmt.close(); rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//DB연결 닫기
		public void close(Connection conn, PreparedStatement pstmt) {
			try {
				conn.close(); pstmt.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	//게시글 전체 목록 반환
		//번호 제목 작성일 조회 글쓴이
	public List<BoardVO> selectBoardAll(){
		BoardVO vo = null;
		List<BoardVO> li = new ArrayList<BoardVO>();
		conn = getConnection();
		try {
			pstmt =conn.prepareStatement("select*from Board");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
				li.add(vo);
			}
			close(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return li;
		
	}
	//특정 게시글 정보 반환
	public BoardVO selectBoard(Integer boardNo) {
		BoardVO vo = null;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("select *from Board where boardNo=?;");
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
			}		
			close(conn, pstmt, rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}	
		return vo;
	}
	//게시글 저장
	public int insertBoard(BoardVO vo) {
		int count=0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("insert into Board(userId, title, content) values(?,?,?);");
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			
			count = pstmt.executeUpdate();
			
			close(conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	//게시글 번호에 해당하는 게시글 수정
	public int updateBoard(BoardVO vo) {
		int count = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(
					"update board set title = ?, content = ? where boardNo = ?;");

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBoardNo());
			
			count = pstmt.executeUpdate();
			
			close(conn, pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	//게시글 번호에 해당하는 게시글 삭제
	public int deleteBoard(Integer boardNo) {
		int count = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("delete from board where boardNo =?");
			pstmt.setInt(1, boardNo);

			count = pstmt.executeUpdate();
			
			close(conn, pstmt);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return count;
	}

	//게시글 개수 반환
	public int getListCount() {
		List<BoardVO> voList = selectBoardAll();
		return voList.size();	//voList의 사이즈만 반환
	}
	//조회수 증가
	public int increaseHit(Integer boardNo){
//		BoardVO vo = selectBoard(boardNo);
//		vo.setHit(vo.getHit()+1); //새롭게 들어가는 hit(setHit)은 기존(getHit)거에 +1한거.
//		updateBoard(vo); 
//		return vo.getHit();
		int count = 0;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("update board set hit=hit+1 where boardNo=?");
			pstmt.setInt(1, boardNo);
			
			count = pstmt.executeUpdate();		
			close(conn, pstmt);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return count;
		
	}
	public List<BoardVO> selectBoardItems(String item, String text){
		BoardVO vo = null;
		List<BoardVO> li = new ArrayList<BoardVO>();
		conn = getConnection();
		try {
			pstmt =conn.prepareStatement("select * from Board where "+item+" Like ? ");
			pstmt.setString(1, "%"+text+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
				li.add(vo);
			}

			close(conn, pstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return li;
		
	}
	
}
