package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ArticleService;
import service.UserService;
import entity.Article;
import entity.User;
@WebServlet("/getarticlebytitle")
public class GetArtbytitleServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String userName = request.getParameter("userName");
			String typeID = request.getParameter("typeID");
			
			ArrayList<Article> list = new ArticleService().getArticlesbyTitle_id(typeID);
			
			User user = new UserService().getUserByUserName(userName);
			request.setAttribute("list", list);
			request.setAttribute("user", user);
			request.getRequestDispatcher("user.jsp").forward(request, response);

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

}
