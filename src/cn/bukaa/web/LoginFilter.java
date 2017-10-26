package cn.bukaa.web;
import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {
	private String indexPage="index.jsp";
	public void init(FilterConfig filterConfig) throws ServletException {
		String indexPage=filterConfig.getInitParameter("indexPage");
		if(indexPage!=null)
			this.indexPage=indexPage;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		Map m=(Map)session.getAttribute("admin");
		if(m == null || m.size() == 0) {
				httpResponse.sendRedirect(httpRequest.getContextPath()
						+ "/" + this.indexPage);
		}else{
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
	}

}
