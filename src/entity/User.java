package entity;

public class User {
	private String fullName = null;
	private String userName = null;
	private String password = null;
	private String sex = null;
	private String birth = null;
	private String phone =null;
	private String email = null;
	private String wechat = null;
	private String information = null;
	private String regis_date = null;
	private boolean status = true;
	
//	public User(String fullName,String userName , String password, String sex, String birth, String email,
//	 String wechat ,
//	 String information ,
//	 String regis_date ,
//	 boolean status ){
//		this.sex = sex;
//		this.birth = birth;
//	}
//	
	public String getUserName() {
		return userName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getRegis_date() {
		return regis_date;
	}
	public void setRegis_date(String regis_date) {
		this.regis_date = regis_date;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
