package Entity;

public class CommentDetail {
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
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	private String comments_content;
	private String ID;
	private String photo;
}
