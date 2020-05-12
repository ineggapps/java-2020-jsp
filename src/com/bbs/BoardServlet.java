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
			list(req, resp);
		} else if (uri.indexOf("created.do") != -1) {
			// 글 등록 폼
			created(req, resp);
		} else if (uri.indexOf("created_ok.do") != -1) {
			// 글 등록 완료
			created_ok(req, resp);
		} else if (uri.indexOf("article.do") != -1) {
			// 글 보기
			article(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			// 글 수정 폼
			update(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			// 글 수정 완료
			update_ok(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			// 글 삭제
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

		//DTO객체에 목록 번호 삽입하기.
		int listNum, n = 0;
		Iterator<BoardDTO> it = list.iterator();
		while (it.hasNext()) {
			BoardDTO dto = it.next();
			listNum = dataCount - (start + n - 1);//게시글 번호 순차적으로 차례 매김
			//게시글이 중간에 삭제된 경우 글번호가 건너뛰는 것은 보기에 좋지 않다.
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

		// list.jsp에 넘겨 줄 데이터
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
		
		//TODO: 2020. 5. 12. 회원가입
		//TODO: 2020. 5. 13. 로그인
		//TODO: 2020. 5. 14. 18c 게시판 + 회원가입 + 로그인 + 쪽지
		
		String query = "page=" + page;
		if(keyword.length()!=0) {
			query += "&condition="+condition + "&keyword="+ URLEncoder.encode(keyword,"UTF-8");
		}
		
		try {
			//조회수 올리기
			dao.updateHitCount(num);
			//게시글
			dao.readBoard(num);
			if(dto==null) {
				resp.sendRedirect(cp + "/cbbs/list.do?"+query);
				return;
			}
			//줄바꿈 처리
			dto.setContent(dto.getContent().replaceAll("\n", "<br />"));
			//이전글, 다음글
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
