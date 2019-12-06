package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DbObject;
import entity.User;

public class UserDao {

	public UserDao() {

	}
	public User addUser(User user){
		Connection cn = null;
		PreparedStatement st = null;
		DbObject db = new DbObject();
		
		//1. 
		try {
			cn = db.open();
			
			//4. 
			String sql = "insert into Users (UserName,Password,FullName) "
					+ " values(?,?,?)";
			
			st = cn.prepareStatement(sql);
			
			st.setString(1, user.getUserName());
			st.setString(2, user.getPassword());
			st.setString(3, user.getFullName());
			int ret = st.executeUpdate();
			
			if (ret>0)
				return user;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			//
			db.close(cn, st, null);
		}
		
		return null;		
	}

	public User findByUserName(String userName){
		DbObject db = new DbObject();
		
		Connection cn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		User user = null;
		
		try {
			cn = db.open();
			
			//4.
			String sql = "select * from Users where userName=?";
			st = cn.prepareStatement(sql);
			
			st.setString(1, userName);
			
			rs = st.executeQuery();
			
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
			db.close(cn, st, rs);
		}
		return user;		
	}

}
