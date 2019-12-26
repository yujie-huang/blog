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
			String sql = "insert into article(type_id,userName,headline,content,publish_date) values(?,?,?,?,?) ";
			i = new DbObject().GenKeyexecuteUpdate(sql, param);
			if(i>0){
				article.setArticle_id(i);
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
			String sql = "select * from articlefull where type_id=?";
			Object param[] = new Object[1];
			param[0]=type_id;
			rs = db.executeQuery(sql, param);
			while (rs.next()) {
				Article article = new Article();
				article.setArticle_id(rs.getInt("article_id"));
				article.setContent(rs.getString("content"));
				article.setHeadline(rs.getString("headline"));
				article.setPublish_date(rs.getString("publish_date"));
				article.setRevise_date(rs.getString("revise_date"));
				article.setStatues(rs.getBoolean("statues"));
				article.setType_id(rs.getInt("type_id"));
				article.setUserName(rs.getString("userName"));
				article.setUserName(rs.getString("fullName"));
				article.setType_name(rs.getString("type_name"));
				
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
	
	
//通过文章ID查文章
	public Article getArtcilebyID(String artID) {
		// TODO Auto-generated method stub
		Article article = new Article();
		DbObject db = new DbObject();
		ResultSet rs = null;

		try {
			// 4.
			String sql = "select * from articlefull where article_id=?";
			Object param[] = new Object[1];
			param[0]=artID;
			rs = db.executeQuery(sql, param);
			while (rs.next()) {
				article.setArticle_id(rs.getInt("article_id"));
				article.setContent(rs.getString("content"));
				article.setHeadline(rs.getString("headline"));
				article.setPublish_date(rs.getString("publish_date"));
				article.setRevise_date(rs.getString("revise_date"));
				article.setStatues(rs.getBoolean("statues"));
				article.setType_id(rs.getInt("type_id"));
				article.setUserName(rs.getString("userName"));
				article.setFullName(rs.getString("fullName"));
				article.setType_name(rs.getString("type_name"));
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
		return article;
	}

	public ArrayList<Article> getArticles() {
		ArrayList<Article> list = new ArrayList<Article>();
		DbObject db = new DbObject();
		ResultSet rs = null;

		try {
			// 4.
			String sql = "select * from articlefull order by publish_date DESC";

			rs = db.executeQuery(sql, null);
			while (rs.next()) {
				Article article = new Article();
				article.setArticle_id(rs.getInt("article_id"));
				article.setContent(rs.getString("content"));
				article.setHeadline(rs.getString("headline"));
				article.setPublish_date(rs.getString("publish_date"));
				article.setRevise_date(rs.getString("revise_date"));
				article.setStatues(rs.getBoolean("statues"));
				article.setType_id(rs.getInt("type_id"));
				article.setUserName(rs.getString("userName"));
				article.setFullName(rs.getString("fullName"));
				article.setType_name(rs.getString("type_name"));
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

	public ArrayList<Article> getArticlesByuserName(String userName) {
		// TODO Auto-generated method stub
		ArrayList<Article> list = new ArrayList<Article>();
		DbObject db = new DbObject();
		ResultSet rs = null;

		try {
			// 4.
			String sql = "select * from articlefull where userName = ?";
			Object param[] = new Object[1];
			param[0]=userName;
			rs = db.executeQuery(sql, param);
			while (rs.next()) {
				Article article = new Article();
				article.setArticle_id(rs.getInt("article_id"));
				article.setContent(rs.getString("content"));
				article.setHeadline(rs.getString("headline"));
				article.setPublish_date(rs.getString("publish_date"));
				article.setRevise_date(rs.getString("revise_date"));
				article.setStatues(rs.getBoolean("statues"));
				article.setType_id(rs.getInt("type_id"));
				article.setUserName(rs.getString("userName"));
				article.setFullName(rs.getString("fullName"));
				article.setType_name(rs.getString("type_name"));
				
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

	public Article revArticle(Article article) {
		int i=0;
		Object[] param = new Object[6];
		param[0]=article.getType_id();
		param[1]=article.getUserName();
		param[2]=article.getHeadline();
		param[3]=article.getContent();
		param[4]=article.getRevise_date();
		param[5]=article.getArticle_id();
		try{
			String sql = "update article set type_id=?,userName=?,headline=?,content=?,revise_date=? where article_id=?";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				return article;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;		
	}

	public boolean delArticle(String artID) {
		int i=0;
		Object[] param = new Object[1];
		param[0]=artID;
		try{
			String sql = "delete from article where article_id=?";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return false;	
	}

	
	//模糊搜索，使用数据库like关键字
	public ArrayList<Article> serach(String funcString, String wordString) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				ArrayList<Article> list = new ArrayList<Article>();
				DbObject db = new DbObject();
				ResultSet rs = null;
				String sql = null;
				try {
					// 4.
					if(funcString.equals("headline"))
						sql = "select * from articlefull where headline like ? order by publish_date DESC";
					else if(funcString.equals("title")){
						sql = "select * from articlefull where type_name like ? order by publish_date DESC ";
					}	
					else {
						sql = "select * from articlefull where fullName like  ? order by publish_date DESC ";
					}
					
					Object param[] = new Object[1];
					param[0]=wordString;
					rs = db.executeQuery(sql, param);
					while (rs.next()) {
						Article article = new Article();
						article.setArticle_id(rs.getInt("article_id"));
						article.setContent(rs.getString("content"));
						article.setHeadline(rs.getString("headline"));
						article.setPublish_date(rs.getString("publish_date"));
						article.setRevise_date(rs.getString("revise_date"));
						article.setStatues(rs.getBoolean("statues"));
						article.setType_id(rs.getInt("type_id"));
						article.setUserName(rs.getString("userName"));
						article.setFullName(rs.getString("fullName"));
						article.setType_name(rs.getString("type_name"));
						
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
