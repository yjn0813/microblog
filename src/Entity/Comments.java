package Entity;

import java.util.ArrayList;


public class Comments {
	
	private String article_id;
	private String article_content;
	private String article_pic;
	private String follow_id;
	public String getFollow_id() {
		return follow_id;
	}
	public void setFollow_id(String followId) {
		follow_id = followId;
	}



	private ArrayList<CommentDetail> commentDetail;
	public ArrayList<CommentDetail> getCommentDetail() {
		return commentDetail;
	}
	public void setCommentDetail(ArrayList<CommentDetail> commentDetail) {
		this.commentDetail = commentDetail;
	}
	public String getArticle_id() {
		return article_id;			
	}
	public void setArticle_id(String articleId) {
		article_id = articleId;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String articleContent) {
		article_content = articleContent;
	}
	public String getArticle_pic() {
		return article_pic;
	}
	public void setArticle_pic(String articlePic) {
		article_pic = articlePic;
	}
	
	//orthers
	
	private String comments_id;
	public String getComments_id() {
		return comments_id;
	}
	public void setComments_id(String commentsId) {
		comments_id = commentsId;
	}
	public String getComments_content() {
		return comments_content;
	}
	public void setComments_content(String commentsContent) {
		comments_content = commentsContent;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	private String comments_content;
	private String ID;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}



	private String photo;



	
}
