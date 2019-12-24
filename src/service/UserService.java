package service;

import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.UserDao;
import entity.User;

public class UserService {
	
	public boolean isExist(String userName){
		if(getUserByUserName(userName)!=null)
			return true;
	
		return false;
		
	}
	
	public boolean register(User user){
		UserDao dao = new UserDao();
		if(isExist(user.getUserName()))
			return false;
		
		return dao.addUser(user);
	}
	
	public boolean login(String userName, String password){
		User user = getUserByUserName(userName);
		if (user == null)
			return false;
		
		//2.
		if (!user.getPassword().equals(password))
			return false;
		
		if(!user.isStatus())
			return false;
		//3.
		
		//4.
		
		//5. 
		
		return true;
	}
	public User getUserByUserName(String userName) {
		UserDao dao = new UserDao();
		return dao.findByUserName(userName);
	}

	public User reUser(User user){
		UserDao dao = new UserDao();
		User rUser = dao.reUser(user);
		
		return rUser;
		
	}

	public boolean rePassword(String userName,String password, String newpassword ) {
		// TODO Auto-generated method stub
		UserDao dao = new UserDao();
		if(dao.findByUserName(userName).getPassword().equals(password)){
			return dao.rePassword(userName,newpassword);
		}
		
		
		return false;
	}

}
