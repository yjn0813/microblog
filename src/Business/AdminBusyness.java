package Business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import struts.form.UpdateNoticeboardForm;

import Entity.Articles;
import Entity.Comments;
import Entity.Noticeboard;
import Entity.Userinfo;

public class AdminBusyness extends BaseBusyness{
	//查询全部用户
	public ArrayList<Userinfo> getAllUsers(){
		ArrayList<Userinfo> aui=new ArrayList<Userinfo>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select m_utable.userid,photo from m_utable,m_userinfo where m_utable.userid=m_userinfo.userid");
			rs=pst.executeQuery();
			while(rs.next()){
				Userinfo ui=new Userinfo();
				ui.setID(rs.getString(1));
				ui.setPhoto(rs.getString(2));
				aui.add(ui);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return aui;
		
	}
	
	//删除用户
	public boolean deleteUser(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from m_userinfo where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from m_userstatus where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from m_userstatus where follow_id=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from m_userstatus where fan_id=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from articles where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from comments where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from at where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from countNum where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from followstatus where userid=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from followstatus where follow_id=?");
			pst.setString(1, userid);
			pst.executeUpdate();
			pst=con.prepareStatement("delete from m_utable where userid=?");
			pst.setString(1, userid);
			int n=pst.executeUpdate();
			if(n>0){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pst);
			close(con);
		}
		return b;
	}
	//管理员查看全部微博
	public ArrayList<Articles> getAllArticles(){
		ArrayList<Articles> aa=new ArrayList<Articles>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from articles");
			rs=pst.executeQuery();
			while(rs.next()){
				Articles a=new Articles();
				a.setArticle_id(rs.getString(1));
				a.setArticle_content(rs.getString(2));
				a.setArticlePic(rs.getString(3));
				a.setID(rs.getString(4));
				aa.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return aa;
	}
	//管理员删除微博
	public boolean adminDeleteArticle(String article_id){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from articles where article_id=?");
			pst.setString(1, article_id);
			int n=pst.executeUpdate();
			if(n>0){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pst);
			close(con);
		}
		return b;
	}
	//管理员查看全部评论
	public ArrayList<Comments> getAllComments(){
		ArrayList<Comments> ac=new ArrayList<Comments>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from comments");
			rs=pst.executeQuery();
			while(rs.next()){
				Comments c=new Comments();
				c.setComments_id(rs.getString(1));
				c.setComments_content(rs.getString(2));
				c.setArticle_id(rs.getString(3));
				c.setID(rs.getString(4));
				ac.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return ac;
	}
	//管理员删除评论
	public boolean adminDeleteComments(String comments_id){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from comments where comments_id=?");
			pst.setString(1, comments_id);
			int n=pst.executeUpdate();
			if(n>0){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pst);
			close(con);
		}
		return b;
	}
	//管理员查看公告栏
	public Noticeboard getNoticeboard(String notice_id){
		Noticeboard n=new Noticeboard();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from noticeboard where notice_id=?");
			pst.setString(1, notice_id);
			rs=pst.executeQuery();
			while(rs.next()){
				n.setNotice_id(rs.getString(1));
				n.setNotice_content(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return n;
	}
	//修改公告栏
	public boolean updateNoticeboard (UpdateNoticeboardForm u){
		boolean b = false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("update noticeboard set notice_content=? where notice_id=?");
			pst.setString(1,u.getNotice_content());
			pst.setString(2,u.getNotice_id());
			int n=pst.executeUpdate();
			if(n>0){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return b;
	}
}
