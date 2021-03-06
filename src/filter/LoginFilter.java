package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String  url = req.getServletPath();
		if(!url.contains("login")
				&&!url.contains("index")
				&&!url.contains("register")
				&&!url.contains("static")
				&&!url.contains("admin")
				&&!url.contains("getarticlebyid")
				&&!url.contains("search")
				&&!url.contains("getuserbyid")
				&&!url.contains("getarticlebytitle")
				&&!url.contains("usermanage")){
			HttpSession session = req.getSession();
			String userName = (String) session.getAttribute("userName");//��ͨ�û���¼���
//			String admin = (String) session.getAttribute("admin"); //����Ա��¼���
			if (userName == null || userName==""){
				res.sendRedirect("/Blog/login");
				return;
			}
			
		}
		
		
		
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
