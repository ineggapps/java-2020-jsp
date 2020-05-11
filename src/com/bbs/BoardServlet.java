package com.bbs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�̹� WebContent������ bbs������ ���������� WebServlet�� ��θ� /bbs/*�� �����ϸ� ���� ��ΰ� ��ģ��.
//�̷��� ��ΰ� ��ġ�� ��쿡�� Servlet�� �켱������ �� ���� ������ WebContent�� /bbs�������� ������ �� ����.
@WebServlet("/cbbs/*")
//@WebServlet: �� annotation�� �̿��Ͽ� �ּҸ� �����Ѵ�.
//�� ����� �̿����� ���� ��� WebContent/WEB-INF/web.xml �ӿ� xml�� �����ؾ� �Ѵ�.
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
		// ������
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		// context path���� ������ ���δ�.
		String uri = req.getRequestURI();
		if (uri.indexOf("list.do") != -1) {
			// �Խñ� ����Ʈ
			list(req,resp);
		} else if (uri.indexOf("created.do") != -1) {
			// �� ��� ��
			created(req,resp);
		} else if (uri.indexOf("created_ok.do") != -1) {
			// �� ��� �Ϸ�
			created_ok(req,resp);
		} else if (uri.indexOf("article.do") != -1) {
			// �� ����
			article(req,resp);
		} else if (uri.indexOf("update.do") != -1) {
			// �� ���� ��
			update(req,resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			// �� ���� �Ϸ�
			update_ok(req,resp);
		} else if (uri.indexOf("delete.do") != -1) {
			// �� ����
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
		System.out.println("�۾��� �õ�");
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
