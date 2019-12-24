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
@WebServlet("/artupdate")
public class ArtupdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("userName");
		if(userName!=null){
			TitleService tService = new TitleService();
			ArrayList<Title> list = tService.findTitleByuserName(userName);
			request.setAttribute("list", list);
		}
		String artID = (String) request.getParameter("ID");

		Article article = new ArticleService().getArticleby_ID(artID);
		request.setAttribute("article", article);
		System.out.println(article.getArticle_id());
		request.getRequestDispatcher("artupdate.jsp").forward(request, response);

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String func = request.getParameter("func");
		String artID=request.getParameter("article_id");
		
		System.out.println(artID);
		 int aID=Integer.parseInt(artID);
		
		if(func!=null){  //删除
			if(func.equals("delete")){
				if(new ArticleService().delArticle(artID))
					response.getWriter().write("1");
				else	
					response.getWriter().write("0");
			}
		}
		else{
			Article article = new Article();
			article.setArticle_id(aID);
			article.setHeadline(request.getParameter("headline"));
			article.setContent(request.getParameter("article"));
			article.setUserName((String) session.getAttribute("userName"));
			article.setType_id(Integer.parseInt(request.getParameter("type_id")));
			
			//
			Date dN = new Date();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
			String nowdateString=ft.format(dN);
			article.setRevise_date(nowdateString);
			System.out.println(ft.format(dN));
			
			ArticleService articleservice = new ArticleService();
			if(articleservice.articleUpdate(article)!=null){
				response.sendRedirect("getarticlebyid?ID="+article.getArticle_id());
				
			}
		}
		
	}

}
