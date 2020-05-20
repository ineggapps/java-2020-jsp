package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter {
	FilterConfig filterConfig;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 선작업 (request필터)
		long before = System.currentTimeMillis();

		// 다음 필터, 또는 마지막 필터이면 요청 페이지(JSP, 서블릿 등)로 이동한다.
		chain.doFilter(request, response);// 따라서 꼭 선언해주어야 한다.

		// 후작업(response필터)
		long after = System.currentTimeMillis();

		String uri;
		if (request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest) request;
			uri = req.getRequestURI();
			filterConfig.getServletContext().log(uri + ": " + (after - before) + "ms 소요");
		}
	}

	@Override
	public void destroy() {

	}

}
