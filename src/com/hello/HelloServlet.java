package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 GET 방식인 경우 실행
		try {
			// 클라이언트에 전송하는 문서 타입
			resp.setContentType("text/html; charset=utf-8");

			// 클라이언트에게 전송할 수 있는 출력 스트림
			PrintWriter out = resp.getWriter();
			out.println("<html>");
			out.println("<head><title>예제</title></head>");
			out.println("<body><h3>GET방식으로 요청</h3>");
			out.println("");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트 요청이 POST 방식인 경우 실행
		try {
			// 클라이언트에 전송하는 문서 타입
			resp.setContentType("text/html; charset=utf-8");

			// 클라이언트에게 전송할 수 있는 출력 스트림
			PrintWriter out = resp.getWriter();
			out.println("<html>");
			out.println("<head><title>예제</title></head>");
			out.println("<body><h3>POST방식으로 요청</h3>");
			out.println("");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
