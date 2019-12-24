package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.enterprise.inject.New;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ArticleService;
import service.TitleService;
import service.UserService;
import entity.Article;
import entity.Title;
import entity.User;

@WebServlet("/getarticlebyid")
public class GetArticlebyIDServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String artID = request.getParameter("ID");
		Article article = new ArticleService().getArticleby_ID(artID);
		request.setAttribute("article", article);
		
		request.getRequestDispatcher("article.jsp").forward(request, response);
	}


//	public void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//
//	}

}
