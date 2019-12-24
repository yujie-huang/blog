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
@WebServlet("/getuserbyid")
public class GetuserByidServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("ID");
		ArrayList<Article> list = new ArticleService().getArticlesByuserName(userName);
		User user = new UserService().getUserByUserName(userName);
		request.setAttribute("list", list);
		request.setAttribute("user", user);
		System.out.println(111111);
		request.getRequestDispatcher("user.jsp").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

}
