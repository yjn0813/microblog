/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import struts.form.LoginForm;
import Business.MicroblogBusiness;
import Entity.Forward;

/** 
 * MyEclipse Struts
 * Creation date: 11-18-2013
 * 
 * XDoclet definition:
 * @struts.action
 * @struts.action-forward name="success" path="/QueryForwardArticles.jsp"
 */
public class QueryForwardArticlesAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MicroblogBusiness mb=new MicroblogBusiness();
		HttpSession session=request.getSession(true);
		LoginForm u=(LoginForm)session.getAttribute("user");
		ArrayList<Forward> af=mb.getForwardArticles(u.getID());
		request.setAttribute("forwardList",af);
		return mapping.findForward("success");
	}
}