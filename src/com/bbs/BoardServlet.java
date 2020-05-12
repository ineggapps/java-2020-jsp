package com.bbs;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

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
			list(req, resp);
		} else if (uri.indexOf("created.do") != -1) {
			// �� ��� ��
			created(req, resp);
		} else if (uri.indexOf("created_ok.do") != -1) {
			// �� ��� �Ϸ�
			created_ok(req, resp);
		} else if (uri.indexOf("article.do") != -1) {
			// �� ����
			article(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			// �� ���� ��
			update(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			// �� ���� �Ϸ�
			update_ok(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			// �� ����
			delete(req, resp);
		} else {
			resp.sendRedirect("list.do");
		}

	}

	public static final String VIEWS = "/WEB-INF/views/bbs";

	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		MyUtil myUtil = new MyUtil();
		String cp = req.getContextPath();

		String page = req.getParameter("page");
		int current_page = 1;
		if (page != null) {
			current_page = Integer.parseInt(page);
		}

		String condition = req.getParameter("condition");
		String keyword = req.getParameter("keyword");
		if (condition == null) {
			condition = "subject";
			keyword = "";
		}
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLEncoder.encode(keyword, "UTF-8");
		}

		int dataCount;
		if (keyword.length() == 0) {
			dataCount = dao.dataCount();
		} else {
			dataCount = dao.dataCount(condition, keyword);
		}

		int rows = 10;
		int total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		List<BoardDTO> list;
		if (keyword.length() == 0) {
			list = dao.listBoard(start, end);
		} else {
			list = dao.listBoard(start, end, condition, keyword);
		}

		//DTO��ü�� ��� ��ȣ �����ϱ�.
		int listNum, n = 0;
		Iterator<BoardDTO> it = list.iterator();
		while (it.hasNext()) {
			BoardDTO dto = it.next();
			listNum = dataCount - (start + n - 1);//�Խñ� ��ȣ ���������� ���� �ű�
			//�Խñ��� �߰��� ������ ��� �۹�ȣ�� �ǳʶٴ� ���� ���⿡ ���� �ʴ�.
			dto.setListNum(listNum);
			n++;
		}

		String query = "";
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		String listUrl = cp + "/cbbs/list.do";
		String articleUrl = cp + "/cbbs/article.do?page=" + current_page;
		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		// list.jsp�� �Ѱ� �� ������
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("totalPage", total_page);
		req.setAttribute("articleUrl", articleUrl);
		
		forward(req, resp, VIEWS + "/list.jsp");
	}

	private void created(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "created");
		forward(req, resp, VIEWS + "/created.jsp");
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
		resp.sendRedirect(cp + "/cbbs/list.do");
	}

	private void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String page = req.getParameter("page");
		
		String condition = req.getParameter("condition");
		String keyword = req.getParameter("keyword");
		
		if(condition==null) {
			condition="subjet";
			keyword="";
		}
		keyword=URLDecoder.decode(keyword,"UTF-8");
		BoardDTO dto = dao.readBoard(num);
		
		//TODO: 2020. 5. 12. ȸ������
		//TODO: 2020. 5. 13. �α���
		//TODO: 2020. 5. 14. 18c �Խ��� + ȸ������ + �α��� + ����
		
		String query = "page=" + page;
		if(keyword.length()!=0) {
			query += "&condition="+condition + "&keyword="+ URLEncoder.encode(keyword,"UTF-8");
		}
		
		try {
			//��ȸ�� �ø���
			dao.updateHitCount(num);
			//�Խñ�
			dao.readBoard(num);
			if(dto==null) {
				resp.sendRedirect(cp + "/cbbs/list.do?"+query);
				return;
			}
			//�ٹٲ� ó��
			dto.setContent(dto.getContent().replaceAll("\n", "<br />"));
			//������, ������
			BoardDTO preReadDto = dao.preReadBoard(num, condition, keyword);
			BoardDTO nextReadDto = dao.nextReadBoard(num, condition, keyword);
			
			req.setAttribute("dto", dto);
			req.setAttribute("preReadDto", preReadDto);
			req.setAttribute("nextReadDto", nextReadDto);
			req.setAttribute("page", page);
			req.setAttribute("query", query);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		forward(req, resp, VIEWS + "/article.jsp");
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String page = req.getParameter("page");
		
		BoardDTO dto = dao.readBoard(num);
		if(dto==null) {
			resp.sendRedirect(cp+"/cbbs/list.do?page="+page);
			return;
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("page", page);
		req.setAttribute("mode", "update");
		forward(req, resp, VIEWS + "/created.jsp");
	}

	private void update_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		String page = req.getParameter("page");
		
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setName(req.getParameter("name"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		dto.setPwd(req.getParameter("pwd"));
		
		try {
			dao.updateBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/cbbs/list.do?page="+page);
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String page = req.getParameter("page");
		
		String condition = req.getParameter("condition");
		String keyword = req.getParameter("keyword");
		
		if(condition==null) {
			condition="subjet";
			keyword="";
		}
		keyword=URLDecoder.decode(keyword,"UTF-8");

		String query = "page=" + page;
		if(keyword.length()!=0) {
			query += "&condition="+condition + "&keyword="+ URLEncoder.encode(keyword,"UTF-8");
		}
		
		
		try {
			dao.deleteBoard(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect(cp + "/cbbs/list.do?" + query);
	}

}
