package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Cookie[] cookies = request.getCookies();
//		boolean flag = false;
//		String userName=null;
//		if(cookies != null){
//			 for (Cookie cookie : cookies) {
//	                if (URLDecoder.decode(cookie.getName(), "utf-8").equals("userName")) { // 表明已经登陆过了，就直接跳转了
//	                    userName = cookie.getValue();
//	                	flag = true;
//	                }
//	            }
//			 }
//		if(flag){
//			request.setAttribute("userName", userName);
//		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}


}
