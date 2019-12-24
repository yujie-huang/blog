package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
import entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		UserService userservice = new UserService();
		if(userservice.login(userName,password)){

			HttpSession session = request.getSession();
			session.setAttribute("userName", userName);
			String fullName = new UserService().getUserByUserName(userName).getFullName();
			session.setAttribute("fullName", fullName);
			
			response.sendRedirect("index");
		}
		else {
			request.setAttribute("userName", userName);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		
	}

}
