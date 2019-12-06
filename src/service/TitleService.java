package service;

import java.awt.List;
import java.util.ArrayList;

import dao.TitleDao;
import entity.Title;

public class TitleService {

	public TitleService() {
		// TODO Auto-generated constructor stub
		
	}
	
	public boolean addTitle(String typeName,String userName){
		TitleDao daoTitle =new TitleDao();
		boolean title = daoTitle.addTitle(userName, typeName);
		return title;
		
	}
	
	public ArrayList<Title> findTitleByuserName(String userName){
		ArrayList<Title> list = new TitleDao().findTitleByuserName(userName);
		
		return list;
	}

}
