package com.guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyCustomUtil;

@WebServlet("/guest/*")
public class GuestServlet extends HttpServlet {

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
		RequestDispatcher disp = req.getRequestDispatcher(path);
		disp.forward(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String uri = req.getRequestURI();
		if (uri.indexOf("/guest_ok.do") > -1) {
			guest_ok(req,resp);
		} else if(uri.indexOf("/delete.do")>-1) {
			delete(req,resp);
		} else {
			list(req,resp);
		}
		
		System.out.println(req.getRequestURI() + "立辟...");
	}
	
	private static final String VIEWS="/WEB-INF/views/guestbook";
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		//其捞隆 贸府
		String cp = req.getContextPath();
		MyCustomUtil myCustomUtil = new MyCustomUtil();
		int current_page = 1;
		int rows = 5;
		int dataCount = dao.dataCount();
		int total_page = myCustomUtil.pageCount(rows, dataCount);
		String pageNum = req.getParameter("page");
		if (pageNum != null) {
			current_page = Integer.parseInt(pageNum);
		}
		String listUrl = cp + "/guest/list.do";
		String deleteUrl = cp + "/guest/delete.do";
		if(current_page>total_page){
			current_page = total_page;
		}
		int[] pages = myCustomUtil.paging(rows, current_page, total_page, listUrl);
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		List<GuestDTO> list = dao.listGuest(start, end);
		String cn = listUrl.indexOf("?") >= 0 ? "&" : "?";
		String delCn = deleteUrl.indexOf("?") >= 0 ? "&" : "?";
		req.setAttribute("current_page", current_page);
		req.setAttribute("total_page", total_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("listUrl", listUrl);
		req.setAttribute("deleteUrl", deleteUrl);
		req.setAttribute("pages", pages);
		req.setAttribute("list", list);
		req.setAttribute("cn", cn);
		req.setAttribute("delCn", delCn);
		
		forward(req,resp,VIEWS+"/guest.jsp");
	}
	
	protected void guest_ok(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		GuestDTO dto = new GuestDTO();
		dto.setName(req.getParameter("name"));
		dto.setContent(req.getParameter("content"));
		try {
			dao.insertGuest(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String cp = req.getContextPath();
		resp.sendRedirect(cp+"/guest/list.do");
	}	
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		try {
			int num = Integer.parseInt(req.getParameter("num"));
			dao.deleteGuest(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String cp = req.getContextPath();
		resp.sendRedirect(cp+"/guest/list.do");
	}	
	

}
