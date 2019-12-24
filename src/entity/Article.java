package entity;

import java.sql.Date;

public class Article {
	private String headline = null;
	private int article_id;
	private String content = null;
	private String userName = null;
	private int type_id = 0;
	private String publish_date =null;
	private String revise_date = null;
	private boolean statues = true;
	
	private String type_name=null;
	private String fullName=null;
	
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String dN) {
		this.publish_date =  dN;
	}
	public String getRevise_date() {
		return revise_date;
	}
	public void setRevise_date(String date) {
		this.revise_date = date;
	}
	public boolean getStatues() {
		return statues;
	}
	public void setStatues(boolean b) {
		this.statues = b;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int id) {
		this.article_id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int i) {
		this.type_id = i;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
}
