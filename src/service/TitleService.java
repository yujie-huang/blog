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
//		System.out.println(typeName);
		if(!isExist(typeName, userName)){
			Title title = daoTitle.addTitle(userName, typeName);
			return title;
		}
		else {
			return null;
		}
		
	}
	
	public ArrayList<Title> findTitleByuserName(String userName){
		ArrayList<Title> list = new TitleDao().findTitleByuserName(userName);
		
		return list;
	}

	public boolean update(String type_id, String type_name,String userName) {
		// TODO Auto-generated method stub
		TitleDao tDao = new TitleDao(); 
		if(!isExist(type_name, userName)&&tDao.update(type_id, type_name))
			return true;
		return false;
	}
	


	public boolean delTitle(String type_id) {
		// TODO Auto-generated method stub
		if(new ArticleService().getArticlesbyTitle_id(type_id).size()==0&&new TitleDao().delbyID(type_id)){ //���������ʹ�ø���������ɾ��
			return true;
		}
		
		
		return false;
	}
	
	public Title findTitleBytitleID(int i){
		return new TitleDao().findTitleBytitleID(i);
	}
	
	public boolean isExist(String type_name,String userName){
		if(new TitleDao().findTitleByName(type_name,userName))
			return true;
		else {
			return false;
		}
	}

}
