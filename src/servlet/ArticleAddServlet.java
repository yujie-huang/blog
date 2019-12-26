package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.ArticleService;
import service.TitleService;
import entity.Article;
import entity.Title;
@WebServlet("/articleadd")
public class ArticleAddServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName=(String) session.getAttribute("userName");
		if(userName!=null){
			TitleService tService = new TitleService();
			ArrayList<Title> list = tService.findTitleByuserName(userName);
			request.setAttribute("list", list);
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
		article.setType_id(Integer.parseInt(request.getParameter("type_id")));
		
		//
		Date dN = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String nowdateString=ft.format(dN);
		article.setPublish_date(nowdateString);
//		System.out.println(ft.format(dN));
		
		ArticleService articleservice = new ArticleService();
		if(articleservice.articleAdd(article)!=null){
			response.sendRedirect("getarticlebyid?ID="+article.getArticle_id());
			
		}
		else {
			request.setAttribute("article",article);
			request.getRequestDispatcher("articleadd.jsp").forward(request, response);
		}
	}

}
