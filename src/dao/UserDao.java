package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import common.DbObject;
import entity.Admin;
import entity.User;

public class UserDao {

	public UserDao() {

	}

	public boolean addUser(User user) {
		int i = 0;
		Object[] param = new Object[3];
		param[0] = user.getUserName();
		param[1] = user.getPassword();
		param[2] = user.getFullName();
		try {
			String sql = "insert into users(userName,password,fullName) values(?,?,?)";
			i = new DbObject().executeUpdate(sql, param);
			if (i > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public User findByUserName(String userName) {
		DbObject db = new DbObject();
		ResultSet rs = null;
		User user = null;

		try {
			// 4.
			String sql = "select * from Users where userName=?";
			Object param[] = new Object[1];
			param[0] = userName;
			rs = db.executeQuery(sql, param);
			if (rs.next()) {
				user = new User();
				user.setUserName(rs.getString("UserName"));
				user.setFullName(rs.getString("FullName"));
				user.setPassword(rs.getString("password"));
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
		return user;
	}

	public User reUser(User user) {
		int i = 0;
		Object[] param = new Object[7];
		param[6] = user.getUserName();
		param[0] = user.getFullName();
		param[1] = user.getSex();
		param[2] = user.getBirth();
		param[3] = user.getEmail();
		param[4] = user.getWechat();
		param[5] = user.getInformation();
		try {
			String sql = "update Users set fullName=?,sex=?,birth=?,email=?,wechat=?,information=? where userName=?";
			i = new DbObject().executeUpdate(sql, param);
			if (i > 0) {
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		ArrayList<User> list = new ArrayList<User>();
		DbObject db = new DbObject();
		ResultSet rs = null;

		try {
			// 4.
			String sql = "select * from users";
			Object param[] = new Object[1];
			rs = db.executeQuery(sql, null);
			while (rs.next()) {
				User user = new User();
				user.setUserName(rs.getString("UserName"));
				user.setFullName(rs.getString("FullName"));
				user.setSex(rs.getString("sex"));
				user.setBirth(rs.getString("birth"));
				user.setEmail(rs.getString("email"));
				user.setWechat(rs.getString("wechat"));
				user.setInformation(rs.getString("information"));
				user.setStatus(rs.getBoolean("status"));
				list.add(user);
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
	
	public boolean changestatus (String userName,boolean f) {
		int i = 0;
		Object[] param = new Object[2];
		param[1] =userName;
		param[0] =f;
		try {
			String sql = "update users set status=? where userName=? ";
			i = new DbObject().executeUpdate(sql, param);
			if (i > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return false;
	}
}
