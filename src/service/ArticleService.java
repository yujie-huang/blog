package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import entity.Article;

public class ArticleService {
	public boolean articleAdd(Article article){
		
		
	Connection cn = null;
	java.sql.Statement st = null;
	boolean flag=false;
	//1.ע������
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
		//2.�����ַ���
		String url = "jdbc:sqlserver://localhost\\MSSQLSERVER:1433;user=sa;password=123;database=blog";
		
		
		//3.�������ݿ�
		cn = DriverManager.getConnection(url);
		
		//4.ִ��SQL���
		st = cn.createStatement();
		String sql = "insert into article(article_id,user_id,headline,content)"
				+"values('"+article.getArticle_id()+"','"+article.getUser_id()+"','"+article.getHeadline()+"','"+article.getContent()+"')";
		System.out.println(sql);
		st.executeUpdate(sql);
		flag=true;
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		//5.�ر�����
		if(st!=null){
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(cn!=null)
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	return flag;
	}
	
	public Article articleShow(String art_id){
		Article article = new Article();
		
		
		
		return article;
	}
}
