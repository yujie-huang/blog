package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

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
	
public Article articleUpdate(Article article){
		
		
		ArticleDao dao = new ArticleDao();
		Article reArticle = dao.revArticle(article);
		
		return reArticle;
	}
	
	
	public ArrayList<Article> getArticlesbyTitle_id(String type_id){
		ArrayList<Article> list=new ArticleDao().findArticleBytype_id(type_id);
		
		return list;
	}
	
	
	public ArrayList<Article> getArticles(){
		ArrayList<Article> list=new ArticleDao().getArticles();
		
		return list;
	}
	
	public ArrayList<Article> getArticlesByuserName( String userName){
		ArrayList<Article> list=new ArticleDao().getArticlesByuserName(userName);
		
		return list;
	}
	
	
	

	public Article getArticleby_ID(String artID) {
		// TODO Auto-generated method stub
		Article article = new ArticleDao().getArtcilebyID(artID);
		return article;
		 
		
	}

	public boolean delArticle(String artID) {
		// TODO Auto-generated method stub
		return new ArticleDao().delArticle(artID);
	}

	public ArrayList<Article> search(String wordString, String funcString) {
		// TODO Auto-generated method stub
		ArrayList<Article> list = new ArrayList<Article>();
		ArticleDao dao = new ArticleDao();
		
		list=dao.serach(funcString,wordString);
		
		
		return list;
	}
	
}
