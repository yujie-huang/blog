package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ArticleService;
import service.UserService;
import entity.Article;
@WebServlet("/personalArticlesmanage")
public class PersonalArticlesmanageServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		ArrayList<Article> list = new ArticleService().getArticlesByuserName(userName);
		request.setAttribute("list",list);
		request.getRequestDispatcher("personalArticlesmanage.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		////删除功能在修改文章方法中
		

	}

}
