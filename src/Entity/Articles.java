package Entity;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class Articles {
	private String ID;
	private String article_id;
	private String follow_id;
	private String photo;
	
	public String getFollow_id() {
		return follow_id;
	}

	public void setFollow_id(String followId) {
		follow_id = followId;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getArticle_id() {
		return article_id;
	}

	public void setArticle_id(String articleId) {
		article_id = articleId;
	}

	public String getID() {
		return ID;
	}

	/** 
	 * Set the ID.
	 * @param ID The ID to set
	 */
	public void setID(String ID) {
		this.ID = ID;
	}
	private String articlePic;
	/** file property */
	

	public String getArticlePic() {
		return articlePic;
	}

	public void setArticlePic(String articlePic) {
		this.articlePic = articlePic;
	}
	/** article_content property */
	private String article_content;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the file.
	 * @return String
	 */
	

	/** 
	 * Returns the article_content.
	 * @return String
	 */
	public String getArticle_content() {
		return article_content;
	}

	/** 
	 * Set the article_content.
	 * @param article_content The article_content to set
	 */
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
}
