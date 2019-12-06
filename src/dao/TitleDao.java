package dao;

import java.awt.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DbObject;
import entity.Title;
import entity.User;

public class TitleDao {

	public TitleDao() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean addTitle(String userName,String typeName){
		boolean flag = false;
		
		int i=0;
		Object[] param = new Object[2];
		param[0]=userName;
		param[1]=typeName;
		
		try{
			String sql = "insert into title(type_name,userName) values(?,?)";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return flag;
		
	}

	public ArrayList<Title> findTitleByuserName(String userName) {
		// TODO Auto-generated method stub
		DbObject db = new DbObject();
		ResultSet rs = null;
		
		ArrayList<Title> list=new ArrayList<Title>();
		
		try{
			String sql = "select * from title where userName=?";
			Object param[] = new Object[1];
			param[0]=userName;
			rs = db.executeQuery(sql,param );
			while(rs.next()){
				Title title = new Title();
				title.setType_id(rs.getInt("type_id"));
				title.setType_name(rs.getString("typename"));
				title.setUserName(rs.getString("userName"));
				list.add(title);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally{
			//¹
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
