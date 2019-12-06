package dao;

import java.sql.ResultSet;
import java.sql.SQLException;


import common.DbObject;
import entity.User;

public class UserDao {

	public UserDao() {

	}
	public User addUser(User user){
		int i=0;
		Object[] param = new Object[3];
		param[0]=user.getUserName();
		param[1]=user.getPassword();
		param[2]=user.getFullName();
		try{
			String sql = "insert into users(userName,password,fullName) values(?,?,?)";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				return user;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;		
	}

	public User findByUserName(String userName){
		DbObject db = new DbObject();
		ResultSet rs = null;
		User user = null;
		
		try {
			//4.
			String sql = "select * from Users where userName=?";
			Object param[] = new Object[1];
			param[0]=userName;
			rs = db.executeQuery(sql,param );	
			if (rs.next()){
				user = new User();
				user.setUserName(rs.getString("UserName"));
				user.setFullName(rs.getString("FullName"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
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
		return user;		
	}


	public User reUser(User user){
		int i=0;
		Object[] param = new Object[7];
		param[6]=user.getUserName();
		param[0]=user.getFullName();
		param[1]=  user.getSex();
		param[2]=  user.getBirth();
		param[3]=  user.getEmail();
		param[4]=user.getWechat() ;
		param[5]= user.getInformation();
		try{
			String sql = "update Users set fullName=?,sex=?,birth=?,email=?,wechat=?,information=? where userName=?";
			i = new DbObject().executeUpdate(sql, param);
			if(i>0){
				return user;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
}
