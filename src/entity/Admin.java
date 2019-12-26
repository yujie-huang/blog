package entity;

public class Admin {

	public Admin() {
		// TODO Auto-generated constructor stub
	}
	private String userId = null;
	private String userPassword = null;
	private String power = null;
//	private String  string;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}

}
