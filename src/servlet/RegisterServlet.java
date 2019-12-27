package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		String err=null;
		String nikName = request.getParameter("nikName");
		Boolean f = true;
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		//判断账户与密码是否合法
		if(userName.length()!=10
				||password.length()<8
				||password.length()>32
				||userName.contains(" ")
				||password.contains(" ")){
			err="账户或密码不合规";
			f=false;
		}
			
		User user = new User();
		user.setFullName(nikName);
		user.setPassword(password);
		user.setUserName(userName);
		user.setSex(sex);
		
		//获取当前时间
		Date dN = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String nowdateString=ft.format(dN);
		user.setRegis_date(nowdateString);
		
		UserService usersevice = new UserService();
		
		if(usersevice.getUserByUserName(userName)!=null){
			f=false;
			err="账户已被注册！请重新选择";
		}
		
		if(f){
			if(usersevice.register(user)){
				response.sendRedirect("login");
				return;
			}
			else {
				err="注册失败，请联系管理员！";
				request.setAttribute("err", err);
				request.setAttribute("user", user);
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}
			
		}
		else {
			request.setAttribute("err", err);
			request.setAttribute("user", user);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
	}


}
