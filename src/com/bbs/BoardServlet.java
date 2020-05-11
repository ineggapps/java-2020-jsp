package com.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//이미 WebContent폴더에 bbs폴더가 존재하지만 WebServlet의 경로를 /bbs/*로 지정하면 서로 경로가 겹친다.
//이렇게 경로가 겹치는 경우에는 Servlet의 우선순위가 더 높기 때문에 WebContent의 /bbs폴더에는 접근할 수 없다.
@WebServlet("/cbbs/*")
//@WebServlet: 이 annotation을 이용하여 주소를 매핑한다.
//이 방법을 이용하지 않을 경우 WebContent/WEB-INF/web.xml 속에 xml로 정의해야 한다.
//<servlet>, <servlet-mapping>
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path)
			throws ServletException, IOException {
		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		// context path부터 끝까지 보인다.
		String uri = req.getRequestURI();
		if (uri.indexOf("list.do") != -1) {
			// 게시글 리스트
			list(req,resp);
		} else if (uri.indexOf("created.do") != -1) {
			// 글 등록 폼
			created(req,resp);
		} else if (uri.indexOf("created_ok.do") != -1) {
			// 글 등록 완료
			created_ok(req,resp);
		} else if (uri.indexOf("article.do") != -1) {
			// 글 보기
			article(req,resp);
		} else if (uri.indexOf("update.do") != -1) {
			// 글 수정 폼
			update(req,resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			// 글 수정 완료
			update_ok(req,resp);
		} else if (uri.indexOf("delete.do") != -1) {
			// 글 삭제
			delete(req,resp);
		}

	}

	public static final String VIEWS="/WEB-INF/views/bbs";
	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req,resp,VIEWS+"/list.jsp");
	}

	private void created(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode","created");
		forward(req,resp,VIEWS+"/created.jsp");
	}

	private void created_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("글쓰기 시도");
		String cp = req.getContextPath();
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setIpAddr(req.getRemoteAddr());
		try {
			dao.insertBoard(dto);
		} catch (Exception e) {
		}
		resp.sendRedirect(cp+"/cbbs/list.do");
	}

	private void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req,resp,VIEWS+"/article.jsp");
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode","update");
		forward(req,resp,VIEWS+"/created.jsp");
	}

	private void update_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		resp.sendRedirect(cp+"/cbbs/list.do");
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		resp.sendRedirect(cp+"/cbbs/list.do");
	}

}
