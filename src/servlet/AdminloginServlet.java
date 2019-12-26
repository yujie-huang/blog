package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AdminService;
import entity.Admin;
@WebServlet("/admin")
public class AdminloginServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Admin admin = new Admin();
		String userId = request.getParameter("u");
		String password = request.getParameter("p");
		if(userId!=null&&password!=null){
			admin.setUserId(userId);
			admin.setUserPassword(password);
		
			if(new AdminService().login(admin)){
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin.getUserId()); //��ֹ���Ա����ͨ�û�
				response.sendRedirect("usermanage");
			}
		else {
			response.sendRedirect("admin");
		}
		} 
		else response.sendRedirect("admin");

	}

}
