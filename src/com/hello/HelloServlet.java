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
		// Ŭ���̾�Ʈ ��û�� GET ����� ��� ����
		try {
			// Ŭ���̾�Ʈ�� �����ϴ� ���� Ÿ��
			resp.setContentType("text/html; charset=utf-8");

			// Ŭ���̾�Ʈ���� ������ �� �ִ� ��� ��Ʈ��
			PrintWriter out = resp.getWriter();
			out.println("<html>");
			out.println("<head><title>����</title></head>");
			out.println("<body><h3>GET������� ��û</h3>");
			out.println("");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Ŭ���̾�Ʈ ��û�� POST ����� ��� ����
		try {
			// Ŭ���̾�Ʈ�� �����ϴ� ���� Ÿ��
			resp.setContentType("text/html; charset=utf-8");

			// Ŭ���̾�Ʈ���� ������ �� �ִ� ��� ��Ʈ��
			PrintWriter out = resp.getWriter();
			out.println("<html>");
			out.println("<head><title>����</title></head>");
			out.println("<body><h3>POST������� ��û</h3>");
			out.println("");
			out.println("</body>");
			out.println("</html>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
