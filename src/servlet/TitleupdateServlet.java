package servlet;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Title;
import service.TitleService;

@WebServlet("/titleupdate")
public class TitleupdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		if(userName!=null){
			TitleService tService = new TitleService();
			ArrayList<Title> list = tService.findTitleByuserName(userName);
			request.setAttribute("list", list);
			request.getRequestDispatcher("titlemanage.jsp").forward(request, response);;
		}
		else {
			response.sendRedirect("login");
		}
	
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		String type_id = request.getParameter("type_id");
		
		String type_name = request.getParameter("type_name");
		
//		System.out.println(type_name+"servlet-name");
//		System.out.println(type_id+"servlet-name");
		
		String func = request.getParameter("func");
		//判断执行方法
		if(func.equals("update")){
			
			TitleService tservice = new TitleService();
			if(tservice.update(type_id,type_name,userName))
				response.getWriter().write("1");
			else	
				response.getWriter().write("0");
	
		}
		else if(func.equals("add")){
			if(new TitleService().addTitle(type_name, userName)!=null)
				response.getWriter().write("1");
			else	
				response.getWriter().write("0");
		}
		
		else if(func.equals("delete")){
			if(new TitleService().delTitle(type_id))
				response.getWriter().write("1");
			else	
				response.getWriter().write("0");
		}
	
	}

}
