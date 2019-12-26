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
	
	public Title addTitle(String userName,String typeName){
		boolean flag = false;
		Title title = new Title();
		int i=-1;
		Object[] param = new Object[2];
		param[0]=userName;
		param[1]=typeName;
		
		try{
			String sql = "insert into title(userName,type_name) values(?,?)";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				title.setType_id(i);
				title.setType_name(typeName);
				title.setUserName(userName);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return title;
		
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
				title.setType_name(rs.getString("type_name"));
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
	
	public boolean update(String type_id, String type_name) {
		boolean flag = false;
		
		int i=0;
		Object[] param = new Object[2];
		param[1]=type_id;
		param[0]=type_name;
		
		try{
			String sql = "update  title set type_name=? where type_id=?";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return flag;
	}

	public boolean delbyID(String type_id) {
		// TODO Auto-generated method stub
       boolean flag = false;
		
		int i=0;
		Object[] param = new Object[1];
		param[0]=type_id;
		
		
		try{
			String sql = "delete from title where type_id=?";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				flag=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return flag;
		
		
	}

	public Title findTitleBytitleID(int i) {
		// TODO Auto-generated method stub
				DbObject db = new DbObject();
				ResultSet rs = null;
				
				Title title=null;
				
				try{
					String sql = "select * from title where type_id=?";
					Object param[] = new Object[1];
					param[0]=i;
					rs = db.executeQuery(sql,param );
					while(rs.next()){
						title = new Title();
						title.setType_id(rs.getInt("type_id"));
						title.setType_name(rs.getString("type_name"));
						title.setUserName(rs.getString("userName"));
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
				return title;
	}

	public boolean findTitleByName(String type_name, String userName) {
		// TODO Auto-generated method stub
		DbObject db = new DbObject();
		ResultSet rs = null;
		 boolean f=false;
		
		try{
			String sql = "select * from title where type_name=? and userName=?";
			Object param[] = new Object[2];
			param[0]=type_name;
			param[1]=userName;
			rs = db.executeQuery(sql,param);
			if(rs.next()){
				 f=true;
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
		return f;
	}

}
