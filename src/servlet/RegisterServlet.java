package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nikName = request.getParameter("nikName");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		user.setFullName(nikName);
		user.setPassword(password);
		user.setUserName(userName);
		
		UserService usersevice = new UserService();
		if(usersevice.getUserByUserName(userName)!=null){
			request.setAttribute("err", "���˻��ѱ�ע��");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			
		}
		else if(usersevice.register(user)){
			response.sendRedirect("login");
		}
		else {
			request.setAttribute("user", user);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
	}


}
