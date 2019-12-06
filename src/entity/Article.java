package entity;

public class Article {
	private String headline = null;
	private int article_id;
	private String content = null;
	private String userName = null;
	private String type_id = null;
	private String publish_date =null;
	private String revise_date = null;
	private int statues = 1;
	
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}
	public String getRevise_date() {
		return revise_date;
	}
	public void setRevise_date(String revise_date) {
		this.revise_date = revise_date;
	}
	public int getStatues() {
		return statues;
	}
	public void setStatues(int statues) {
		this.statues = statues;
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
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
