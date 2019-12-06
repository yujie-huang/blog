package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbObject;
import entity.Admin;
import entity.User;


public class AdminDao {

	public AdminDao() {
		// TODO Auto-generated constructor stub
	}

	public Admin findAdminById(String userId) {
		// TODO Auto-generated method stub
		DbObject db = new DbObject();
		ResultSet rs = null;
		Admin admin = null;
		
		try {
			//4.
			String sql = "select * from admin where userId=?";
			Object param[] = new Object[1];
			param[0]=userId;
			rs = db.executeQuery(sql,param );	
			if (rs.next()){
				admin = new Admin();
				admin.setUserId(rs.getString("userId"));
				admin.setUserPassword(rs.getString("userPassword"));
				admin.setPower(rs.getString("power"));
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
		return admin;	
	}

	public List<Admin> fingAll() {
		// TODO Auto-generated method stub
		ArrayList<Admin> list= new ArrayList<Admin>();
		DbObject db = new DbObject();
		ResultSet rs = null;
		
		
		try {
			//4.
			String sql = "select * from users";
			Object param[] = new Object[1];
			rs = db.executeQuery(sql,null );	
			while (rs.next()){
				Admin admin = new Admin();
				admin.setUserId(rs.getString("userId"));
				admin.setUserPassword(rs.getString("userPassword"));
				admin.setPower(rs.getString("power"));
				list.add(admin);
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
		return list;	
	}
	


}
