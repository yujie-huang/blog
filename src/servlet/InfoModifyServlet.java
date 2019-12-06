package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
import entity.User;
@WebServlet("/infomodify")
public class InfoModifyServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session!=null){
			String userName = (String) session.getAttribute("userName");
			User user = new User();
			UserService userservice= new UserService();
			user = userservice.getUserByUserName(userName);
			request.setAttribute("user", user);
			request.getRequestDispatcher("infomodify.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("login");
		}
			
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User user = new User();
		UserService userService = new UserService();
		user.setUserName(request.getParameter("userName"));
		user.setFullName(request.getParameter("fullName"));
		user.setBirth(request.getParameter("birth"));
		user.setSex(request.getParameter("sex"));
		user.setEmail(request.getParameter("email"));
		user.setWechat(request.getParameter("wechat"));
		user.setInformation(request.getParameter("information"));
		
		if(userService.reUser(user)!=null){
			response.sendRedirect("userinfo");
		}
		else {
			request.getRequestDispatcher("infomodify.jsp").forward(request, response);
		}
	}

}
