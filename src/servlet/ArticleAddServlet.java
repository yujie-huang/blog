package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ArticleService;
import entity.Article;
@WebServlet("/articleadd")
public class ArticleAddServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("userName")!=null){
			request.getRequestDispatcher("articleadd.jsp").forward(request, response);
		}
			
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Article article = new Article();
		article.setArticle_id(request.getParameter("headline"));
		article.setHeadline(request.getParameter("headline"));
		article.setContent(request.getParameter("article"));
		article.setUser_id((String) session.getAttribute("userName"));
		ArticleService articleservice = new ArticleService();
		if(articleservice.articleAdd(article)){
			response.sendRedirect("index");
			
		}
		else {
			request.setAttribute("article",article);
			request.getRequestDispatcher("articleadd.jsp").forward(request, response);
		}
	}

}
