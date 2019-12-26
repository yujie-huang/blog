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
		if(session.getAttribute("admin")!=null){ //����Ƿ�Ϊ����Ա��¼
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
		String func = request.getParameter("func");//获取执行方法
		
		System.out.println(func);
		
		AdminService adminService = new AdminService();
		if(func.equals("change")){
			if(statu.equals("1")){
				if(adminService.changestatus(userName, true))
					response.getWriter().write("1");
				else	
					response.getWriter().write("0");
			}
			else if(statu.equals("0")){
					if(adminService.changestatus(userName, false))
						response.getWriter().write("1");
					else 
						response.getWriter().write("0");
			}
		}
		else if(func.equals("repwd")){
			String newpassword = request.getParameter("newpassword");
			if(new AdminService().rePassword(userName,newpassword)){
				response.getWriter().write("1");
			}
			else {
				response.getWriter().write("0");
			}
		}

	}

}
