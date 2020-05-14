package com.file;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/upload/*")
@MultipartConfig(location = "c:/temp", // 폴더가 없으면 업로드되지 않는다. (대소문자 구분)
		fileSizeThreshold = 1024 * 1024, // 업로드된 파일을 임시경로로 보내지 않고 메모리에서 스트림으로 바로 보내는 크기
		// threshold: 1.기준점2.입구3.한계점
		maxFileSize = 1024 * 1024 * 5, // 업로드할 파일의 크기. 기본은 무제한이지만 톰캣에서 5MB까지로 제한하고 있음.
		maxRequestSize = 1024 * 1024 * 5 * 10 // 폼 전체 용량
)
public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String uri = req.getRequestURI();
		if (uri.indexOf("write.do") != -1) {
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/file/write.jsp");
			rd.forward(req, resp);
		} else if (uri.indexOf("write_ok.do") != -1) {
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); // 실제 서버가 실행되는 물리 경로를 의미한다.
			String pathname = root + "uploads" + File.separator + "pds";
			File f = new File(pathname);
			if (!f.exists()) {
				f.mkdirs();
			}

			// 파라미터 하나당 Part 하나라고 생각하면 된다.
			// Collection<Part> pp = req.getParts(); //모든 파트를 가져오는 방법.

			String subject = req.getParameter("subject");
			Part p = req.getPart("selectFile");// input[name="selectFile"]
			String originalFilename = getOriginalFilename(p);
			String saveFilename = null;
			if (originalFilename != null) {
				String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
				saveFilename = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				saveFilename += System.nanoTime();
				saveFilename += fileExt;

				String fullpath = pathname + File.separator + saveFilename;
				p.write(fullpath);
			}

			req.setAttribute("subject", subject);
			req.setAttribute("originalFilename", originalFilename);
			req.setAttribute("saveFilename", saveFilename);

			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/file/result.jsp");
			rd.forward(req, resp);
		}

	}

	private String getOriginalFilename(Part p) {// input, checkbox, radio, select 등... 각 태그 하나가 part 하나라고 생각하면 된다.
		for (String s : p.getHeader("content-disposition").split(";")) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
