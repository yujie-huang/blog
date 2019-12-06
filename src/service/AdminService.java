package service;

import java.util.List;

import dao.AdminDao;
import entity.Admin;

public class AdminService {

	public AdminService() {
		// TODO Auto-generated constructor stub
	}

	public boolean login(Admin admin) {
		// TODO Auto-generated method stub
		String userId = admin.getUserId();
		String password = admin.getUserPassword();
		
		
		//—È÷§√‹¬Î
		Admin nadmin = new AdminDao().findAdminById(userId);
		if(password.equals(nadmin.getUserPassword())){
			return true;
		}
		
		return false;
		

	}

	public List<Admin> findall() {
		// TODO Auto-generated method stub
		
		
		
		return new AdminDao().fingAll();
	}

}
