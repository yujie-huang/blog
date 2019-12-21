package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DbObject;
import entity.Article;
import entity.User;


public class ArticleDao {

	public ArticleDao() {
		// TODO Auto-generated constructor stub
	}
	
	public Article addArticle(Article article){
		int i=0;
		Object[] param = new Object[5];
		param[0]=article.getType_id();
		param[1]=article.getUserName();
		param[2]=article.getHeadline();
		param[3]=article.getContent();
		param[4]=article.getPublish_date();
		try{
			String sql = "insert into article(type_id,userName,headline,content,publish_date) values(?,?,?,?,?)";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				return article;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;		
	}
	
	
	//修改文章
	public Article reArticle(Article article){
		
		
		return new Article();
	}

	
	//通过类型查找文章
	public ArrayList<Article> findArticleBytype_id(String type_id) {
		// TODO Auto-generated method stub
		
		ArrayList<Article> list = new ArrayList<Article>();
		DbObject db = new DbObject();
		ResultSet rs = null;

		try {
			// 4.
			String sql = "select * from articles where type_id=?";
			Object param[] = new Object[1];
			rs = db.executeQuery(sql, null);
			while (rs.next()) {
				Article article = new Article();
				article.setArticle_id(rs.getInt("article_id"));
				list.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// ¹
			db.close();
		}
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
