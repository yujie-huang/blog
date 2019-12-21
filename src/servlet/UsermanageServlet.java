package servlet;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AdminService;
import service.UserService;
import entity.Admin;
import entity.User;
@WebServlet("/usermanage")
public class UsermanageServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("admin")!=null){ //检测是否为管理员登录
			AdminService service = new AdminService();
			List<User> list = service.findall();
			request.setAttribute("list", list);
//			System.out.println("lllllll");
			request.getRequestDispatcher("usermanage.jsp").forward(request, response);
		}
		else
			response.sendRedirect("admin");
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String statu = request.getParameter("statu");
		
		System.out.println(statu);
		AdminService adminService = new AdminService();
		if(statu.equals("1")){
//			 PrintWriter out = response.getWriter();
			  
			if(adminService.changestatus(userName, true))
//				out.print("1");
				response.getWriter().write("1");
			else	
				response.getWriter().write("0");
//			out.print("0");
//			out.flush();
//			out.close();
		}
		else if(statu.equals("0")){
//			 PrintWriter out = response.getWriter();
			  
				if(adminService.changestatus(userName, false))
//					out.print("1");
					response.getWriter().write("1");
				else 
					response.getWriter().write("0");
//					out.print("0");
//				out.flush();
//				out.close();
		}

	}

}
