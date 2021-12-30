package com.conan.vo.Products;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response); // actionDo로 보내서 처리

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// cmd추출
		String uri = request.getRequestURI();
		System.out.println("uri :" + uri); // BoardController.java 를 실행시켰을 때의 uri.
		String ctxPath = request.getContextPath(); // ContextPath() : 절대 경로.
		System.out.println("ctxPath :" + ctxPath); //
		String cmd = uri.substring(ctxPath.length()); // substring : uri에서 절대경로를 빼줌.
		System.out.println("cmd :" + cmd);

		BoardDAO dao = BoardDAO.getInstance();// singleton으로 했기때문에

		if (cmd.equals("/board/writeProc.do")) { // DB에 게시글 저장 후 listProc.do로 이동
			String userId = request.getParameter("userId");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
			try {
				Integer boardNo = Integer.parseInt(request.getParameter("boardNo"));
				
				System.out.println("update");
				dao.updateBoard(new BoardVO(boardNo, userId, title, content));
				response.sendRedirect(request.getContextPath()+ "/board/listProc.do");
			} catch (NumberFormatException e) {
				System.out.println("insert");
				dao.insertBoard(new BoardVO(userId, title, content));
				response.sendRedirect(request.getContextPath()+ "/board/listProc.do");
				// //절대경로에 " "경로를 붙인곳으로 페이지 이동.

			}

//			String userId = request.getParameter("userId");
//			String title = request.getParameter("title");
//			String content = request.getParameter("content");
//			
//			dao.insertBoard(new BoardVO(userId, title, content));			
//			response.sendRedirect(request.getContextPath()+ "/board/listProc.do"); //절대경로에 "  "경로를 붙인곳으로 페이지 이동.

		} else if (cmd.equals("/board/listProc.do")) { // 게시글 목록 DB에서 불러와서 list.jsp에 출력하기
//			BoardDAO dao = BoardDAO.getInstance();	//singleton으로 했기때문에---위로 올려버림
			String item = request.getParameter("items");
			String text = request.getParameter("text");
			List<BoardVO> al = null;
			if(text==null) {
				al = dao.selectBoardAll();} // return을 arraylist로 선언햇기떄문에 적어줌. & 리스트al을 생성하고
														// dao.selectBoardAll()=게시글 전체 글목록 저장.
			else
				{al = dao.selectBoardItems(item, text);}
			request.setAttribute("list", al); // 리스트 al을 "list"로 사용하겠다고 지정.
			System.out.println("목록..");
			RequestDispatcher rd = request.getRequestDispatcher("/board/list.jsp");
			rd.forward(request, response);
//			response.sendRedirect(request.getContextPath()+ "/board/list.jsp");	//sendRedirectd와 RequestDispatcher의 차이를 알게됨.

		} else if (cmd.equals("/board/viewProc.do")) { // 패러미터 추출해서 게시글 번호에 해당하는 글 조회수 증가하기, 불러와서 view.jsp에 출력하기
			System.out.println("보드넘");

			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			dao.increaseHit(boardNo);
			BoardVO vo = dao.selectBoard(boardNo);
			request.setAttribute("item", vo);

			RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
			rd.forward(request, response);
//			response.sendRedirect(request.getContextPath()+ "/board/view.jsp"); 
		} else if (cmd.equals("/board/deleteProc.do")) {// 삭제
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			dao.deleteBoard(boardNo);

			response.sendRedirect(request.getContextPath() + "/board/listProc.do");
//			 RequestDispatcher rd = request.getRequestDispatcher("/listProc.do");
//			 rd.forward(request, response);
		} else if (cmd.equals("/board/updateProc.do")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			request.setAttribute("boardNo", boardNo);
//			response.sendRedirect(request.getContextPath()+"/board/writeFrm.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("/board/writeFrm.jsp");
			rd.forward(request, response);

		}
	}
}
