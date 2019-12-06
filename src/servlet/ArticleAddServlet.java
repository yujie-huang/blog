package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		
		article.setHeadline(request.getParameter("headline"));
		article.setContent(request.getParameter("article"));
		article.setUserName((String) session.getAttribute("userName"));
		article.setType_id(request.getParameter("type_id"));
		
		//获取当前时间并格式化
		Date dN = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		article.setPublish_date(ft.format(dN));
		ArticleService articleservice = new ArticleService();
		if(articleservice.articleAdd(article)!=null){
			response.sendRedirect("index");
			
		}
		else {
			request.setAttribute("article",article);
			request.getRequestDispatcher("articleadd.jsp").forward(request, response);
		}
	}

}
