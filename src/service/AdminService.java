package service;

import java.util.List;

import dao.AdminDao;
import dao.UserDao;
import entity.Admin;
import entity.User;

public class AdminService {

	public AdminService() {
		// TODO Auto-generated constructor stub
	}

	public boolean login(Admin admin) {
		// TODO Auto-generated method stub
		String userId = admin.getUserId();
		String password = admin.getUserPassword();
		
		
		//
		Admin nadmin = new AdminDao().findAdminById(userId);
		if(password.equals(admin.getUserPassword())){
			return true;
		}
		
		return false;
		

	}

	public List<User> findall() {
		// TODO Auto-generated method stub
		
		
		
		return new UserDao().findAll();
	}
	
	
	public boolean changestatus(String userName, boolean f) {
		return new UserDao().changestatus(userName, f);
	}

}
