package cn.bukaa.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class CharsetFilter implements Filter {
	private String encoding="UTF-8";
	public void init(FilterConfig filterConfig) throws ServletException {
		String encoding=filterConfig.getInitParameter("encoding");
		if(encoding!=null)
			this.encoding=encoding;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(this.encoding);
		response.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response);
	}

	public void destroy() {
	}
	
}
