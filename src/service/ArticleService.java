package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import dao.UserDao;
import entity.Article;
import entity.User;

public class ArticleService {
	public Article articleAdd(Article article){
		
		
		ArticleDao dao = new ArticleDao();
		Article newArticle = dao.addArticle(article);
		
		return newArticle;
	}
	
	public Article articleShow(String art_id){
		Article article = new Article();

		
		
		return article;
	}
	
	
}
