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
		서블릿 맛보기...
		1. 객체 생성시점: 서블릿 객체는 "톰캣"이 최초에 방문을 요청받았을 때 객체를 생성한다.
		2. 이후 지속적인 요청이 있을 때는 init메서드를 호출하지 않는다.(==초기화 작업을 실행하지 않는다)
		3. 객체 소멸시점: 객체가 소멸되는 시점은 개발자가 알 수 없고 서버가 종료될 때나 한참동안 요청이 없으면 JVM에 의해 객체가 회수되어 소멸된다.
 */

public class UserServlet extends GenericServlet {
	private static final long serialVersionUID = 1L;

	private int count = 0;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// 서버에서의 초기화 작업 명시
		// ...
		System.out.println("서블릿이 초기화될 때 단 한 번 실행된다. (생성자 바로 다음에 호출됨)");
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// 클라이언트가 요청할 때마다 실행된다.
		try {
//			ServletRequest: 클라이언트가 요청할 때 가지고 있는 객체
//			ServletResponse: 요청된 정보를 실행한 후에 결과를 처리하고 응답할 정보를 가지고 있는 객체
			count++;
			String msg = "지금 접속하신 분은 <b>" + count + "</b>번째 접속입니다." +  req.getParameter("name") + "님 하이.";
			String str = String.format("%1$tF %1$tA %1$tT", Calendar.getInstance());
			// 클라이언트에 보내는 문서의 타입
			//setContentType을 명시하지 않으면 ISO8855-1 인코딩으로 처리
			res.setContentType("text/html; charset=utf-8");
			// 클라이언트에 문서를 전송할 출력 객체
			PrintWriter out = res.getWriter();
			// 클라이언트에게 HTML 문서 전송
			out.print("<html>");
			out.print("<head><title>첫 번째 예제</title></head>");
			out.print("<body>");
			out.print("<p>" + msg + "</p>");
			out.print("<p>" + str + "</p>");
			out.print("</body>");
			out.print("</html>");
		} catch (Exception e) {
			getServletContext().log("Error in servlet", e);// 로그 출력
		}
	}

	@Override
	public void destroy() {
		// 서블릿이 소멸될 때 단 한 번만 실행된다.
		System.out.println("서블릿이 파괴될 때 단 한 번 실행된다.");
	}
}
