package service;

import java.awt.List;
import java.util.ArrayList;

import dao.ArticleDao;
import dao.TitleDao;
import entity.Article;
import entity.Title;

public class TitleService {

	public TitleService() {
		// TODO Auto-generated constructor stub
		
	}
	
	public Title addTitle(String typeName,String userName){
		TitleDao daoTitle =new TitleDao();
		System.out.println(typeName);
		Title title = daoTitle.addTitle(userName, typeName);
		return title;
		
	}
	
	public ArrayList<Title> findTitleByuserName(String userName){
		ArrayList<Title> list = new TitleDao().findTitleByuserName(userName);
		
		return list;
	}

	public boolean update(String type_id, String type_name) {
		// TODO Auto-generated method stub
		TitleDao tDao = new TitleDao(); 
		if(tDao.update(type_id, type_name))
			return true;
		return false;
	}
	
	public ArrayList<Article> findArticleBytype_id(String type_id){
		ArrayList<Article> list = new ArticleDao().findArticleBytype_id(type_id);
		
		return list;
		
		
	}

	public boolean delTitle(String type_id) {
		// TODO Auto-generated method stub
		if(new ArticleService().getArticlesbyTitle_id(type_id).size()==0&&new TitleDao().delbyID(type_id)){ //如果有文章使用该类型则不能删除
			return true;
		}
		
		
		return false;
	}
	

}
