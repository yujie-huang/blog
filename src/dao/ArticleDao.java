package dao;

import common.DbObject;
import entity.Article;


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
	
	
	//пч╦дндуб
	public Article reArticle(Article article){
		
		
		return new Article();
	}

}
