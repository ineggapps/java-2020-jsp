package com.user1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
		���� ������...
		1. ��ü ��������: ���� ��ü�� "��Ĺ"�� ���ʿ� �湮�� ��û�޾��� �� ��ü�� �����Ѵ�.
		2. ���� �������� ��û�� ���� ���� init�޼��带 ȣ������ �ʴ´�.(==�ʱ�ȭ �۾��� �������� �ʴ´�)
		3. ��ü �Ҹ����: ��ü�� �Ҹ�Ǵ� ������ �����ڰ� �� �� ���� ������ ����� ���� �������� ��û�� ������ JVM�� ���� ��ü�� ȸ���Ǿ� �Ҹ�ȴ�.
 */

public class UserServlet extends GenericServlet {
	private static final long serialVersionUID = 1L;

	private int count = 0;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// ���������� �ʱ�ȭ �۾� ���
		// ...
		System.out.println("������ �ʱ�ȭ�� �� �� �� �� ����ȴ�. (������ �ٷ� ������ ȣ���)");
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// Ŭ���̾�Ʈ�� ��û�� ������ ����ȴ�.
		try {
//			ServletRequest: Ŭ���̾�Ʈ�� ��û�� �� ������ �ִ� ��ü
//			ServletResponse: ��û�� ������ ������ �Ŀ� ����� ó���ϰ� ������ ������ ������ �ִ� ��ü
			count++;
			String msg = "���� �����Ͻ� ���� <b>" + count + "</b>��° �����Դϴ�." +  req.getParameter("name") + "�� ����.";
			String str = String.format("%1$tF %1$tA %1$tT", Calendar.getInstance());
			// Ŭ���̾�Ʈ�� ������ ������ Ÿ��
			//setContentType�� ������� ������ ISO8855-1 ���ڵ����� ó��
			res.setContentType("text/html; charset=utf-8");
			// Ŭ���̾�Ʈ�� ������ ������ ��� ��ü
			PrintWriter out = res.getWriter();
			// Ŭ���̾�Ʈ���� HTML ���� ����
			out.print("<html>");
			out.print("<head><title>ù ��° ����</title></head>");
			out.print("<body>");
			out.print("<p>" + msg + "</p>");
			out.print("<p>" + str + "</p>");
			out.print("</body>");
			out.print("</html>");
		} catch (Exception e) {
			getServletContext().log("Error in servlet", e);// �α� ���
		}
	}

	@Override
	public void destroy() {
		// ������ �Ҹ�� �� �� �� ���� ����ȴ�.
		System.out.println("������ �ı��� �� �� �� �� ����ȴ�.");
	}
}
