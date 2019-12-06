package servlet;

import java.util.List;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AdminService;
import entity.Admin;
@WebServlet("/usermanage")
public class UsermanageServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId")!=null){
			AdminService service = new AdminService();
			List<Admin> list = service.findall();
			request.setAttribute("list", list);
			request.getRequestDispatcher("usernamage.jsp").forward(request, response);
		}
		response.sendRedirect("anmin");
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

}
