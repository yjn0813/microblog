package Business;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import struts.form.AddForwardDetailForm;
import struts.form.CommentsAddForm;
import struts.form.FollowForm;
import struts.form.NewArticleForm;
import Entity.Articles;
import Entity.CommentDetail;
import Entity.Comments;
import Entity.CountNum;
import Entity.Forward;
import Entity.Userinfo;
import Entity.Userstatus;

public class MicroblogBusiness extends BaseBusyness{
//发新微博
	public boolean newArticle(NewArticleForm u,String ID,String bp){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("insert into articles values(?,?,?,?)");
			pst.setString(1,u.getArticle_id());
			pst.setString(2,u.getArticle_content());
			pst.setString(3,bp);
			pst.setString(4,ID);
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
//显示当前用户微博	
	public ArrayList<Articles> getUserArticles(String ID){
		ArrayList<Articles> aa=new ArrayList<Articles>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from articles where userid=?");
			pst.setString(1, ID);
			rs=pst.executeQuery();
			while(rs.next()){
				Articles a=new Articles();
				a.setArticle_id(rs.getString(1));
				a.setArticle_content(rs.getString(2));
				a.setArticlePic(rs.getString(3));
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
	//显示关注人微博
	public ArrayList<Articles> getFollowsArticles(String ID){
		ArrayList<Articles> aa=new ArrayList<Articles>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select article_id,article_content,article_pic,follow_id,photo from articles,m_userstatus,m_userinfo where articles.userid=m_userstatus.follow_id and m_userinfo.userid=m_userstatus.follow_id and m_userstatus.userid=?");
			pst.setString(1, ID);
			rs=pst.executeQuery();
			while(rs.next()){
				Articles a=new Articles();
				a.setArticle_id(rs.getString(1));
				a.setArticle_content(rs.getString(2));
				a.setArticlePic(rs.getString(3));
				a.setFollow_id(rs.getString(4));
				a.setPhoto(rs.getString(5));
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
	//删除微博
	public boolean deleteArticle(String article_id){
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
	//找人
	public ArrayList<Userinfo> getUsers(String s,String userid){
		ArrayList<Userinfo> aui=new ArrayList<Userinfo>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		PreparedStatement pst1=null;
		ResultSet rs1=null;
		try {
			pst=con.prepareStatement("select userid,photo from m_userinfo where userid like '%"+s+"%'");
			rs=pst.executeQuery();
			Userinfo ui=null;
			while(rs.next()){
				ui=new Userinfo();
				ui.setID(rs.getString(1));
				ui.setPhoto(rs.getString(2));
				pst1=con.prepareStatement("select status from followstatus where follow_id=? and userid=?");
				pst1.setString(1, rs.getString(1));
				pst1.setString(2, userid);
				rs1=pst1.executeQuery();
				if (rs1.next()) {					
					ui.setStatus(rs1.getString(1));
				}
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
	//加关注
	public boolean follow(FollowForm u){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("insert into m_userstatus values(?,'',?)");
			pst.setString(1,u.getFollow_id());
			pst.setString(2,u.getID());
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
	//对方被关注
	public boolean befollowed(FollowForm u){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("insert into m_userstatus values('',?,?)");
			pst.setString(1,u.getID());
			pst.setString(2,u.getFollow_id());
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
	//关注状态变为“已关注”
	public boolean changeFollowstatus(FollowForm u){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("update followstatus set status=? where follow_id=? and userid=?");
			pst.setString(1,u.getStatus());
			pst.setString(2,u.getFollow_id());
			pst.setString(3,u.getID());
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
	//关注状态变为“+关注”
	public boolean changeFollowstatus1(String follow_id,String ID){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("update followstatus set status='+关注' where follow_id='"+follow_id+"' and userid='" + ID +"'");
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
	//显示关注的人
	public ArrayList<Userstatus> getFollows(String ID){
		ArrayList<Userstatus> au=new ArrayList<Userstatus>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select follow_id,photo,profile from m_userstatus,m_userinfo where m_userinfo.userid=m_userstatus.follow_id and m_userstatus.userid=?");
			pst.setString(1, ID);
			rs=pst.executeQuery();
			while(rs.next()){
				Userstatus u=new Userstatus();
				u.setFollow_id(rs.getString(1));
				u.setPhoto(rs.getString(2));
				u.setProfile(rs.getString(3));
				au.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return au;
	}
	//显示粉丝
	public ArrayList<Userstatus> getFans(String ID){
		ArrayList<Userstatus> au=new ArrayList<Userstatus>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select fan_id,photo,profile from m_userstatus,m_userinfo where m_userinfo.userid=m_userstatus.fan_id and m_userstatus.userid=?");
			pst.setString(1, ID);
			rs=pst.executeQuery();
			while(rs.next()){
				Userstatus u=new Userstatus();
				u.setFan_id(rs.getString(1));
				u.setPhoto(rs.getString(2));
				u.setProfile(rs.getString(3));
				au.add(u);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return au;
	}
	//删除关注的人
	public boolean deleteFollow(String follow_id,String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from m_userstatus where follow_id=? and userid=?");
			pst.setString(1, follow_id);
			pst.setString(2, userid);
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
	//删除对方粉丝是我的记录
	public boolean deleteOppositeFan(String userid,String follow_id){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from m_userstatus where fan_id=? and userid=?");
			pst.setString(1, userid);
			pst.setString(2, follow_id);
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
	//删除粉丝
	public boolean deleteFan(String fan_id,String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from m_userstatus where fan_id=? and userid=?");
			pst.setString(1, fan_id);
			pst.setString(2, userid);
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
	//删除对方关注是我的记录
	public boolean deleteOppositeFollow(String userid,String fan_id){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from m_userstatus where follow_id=? and userid=?");
			pst.setString(1, userid);
			pst.setString(2, fan_id);
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
	//发表评论
	public boolean addComments(CommentsAddForm u,String ID){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("insert into comments values(?,?,?,?)");
			pst.setString(1,u.getComments_id());
			pst.setString(2,u.getComments_content());
			pst.setString(3,u.getArticle_id());
			pst.setString(4,ID);
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
	//评论完成
	public ArrayList<Comments> confirmComments(String article_id){
		ArrayList<Comments> ac=new ArrayList<Comments>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select comments_content,photo,comments.userid from comments,m_userinfo where m_userinfo.userid=comments.userid and comments.article_id=?");
			pst.setString(1, article_id);
			rs=pst.executeQuery();
			while(rs.next()){
				Comments c=new Comments();
				c.setComments_content(rs.getString(1));
				c.setPhoto(rs.getString(2));
				c.setID(rs.getString(3));
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
	//收到的评论
	public ArrayList<Comments> queryRecievedComments(String userid){
		ArrayList<Comments> ac=new ArrayList<Comments>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		try {
			pst=con.prepareStatement("select distinct article_content,article_pic from articles,comments where articles.article_id=comments.article_id and articles.userid=?");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			Comments c=null;
			CommentDetail cd=null;
			ArrayList<CommentDetail> cdlist= null;
			while(rs.next()){
				pst=con.prepareStatement("select photo,comments.userid,comments_content from comments,m_userinfo,articles where m_userinfo.userid=comments.userid and comments.article_id=articles.article_id and articles.article_content=?");
				pst.setString(1, rs.getString(1));
				c=new Comments();
				cdlist= new ArrayList<CommentDetail>();
				rs1=pst.executeQuery();
				while(rs1.next()){
					cd = new CommentDetail();
					cd.setPhoto(rs1.getString(1));
					cd.setID(rs1.getString(2));
					cd.setComments_content(rs1.getString(3));
					cdlist.add(cd);
				}
				c.setArticle_content(rs.getString(1));
				c.setArticle_pic(rs.getString(2));
				c.setCommentDetail(cdlist);
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
	//我发出的评论
	public ArrayList<Comments> queryMyComments(String userid){
		ArrayList<Comments> ac=new ArrayList<Comments>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select comments_id,comments_content,article_content,article_pic,photo,comments.userid,articles.userid from articles,comments,m_userinfo where articles.article_id=comments.article_id and m_userinfo.userid=comments.userid and comments.userid=?");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			while(rs.next()){
				Comments c=new Comments();
				c.setComments_id(rs.getString(1));
				c.setComments_content(rs.getString(2));
				c.setArticle_content(rs.getString(3));
				c.setArticle_pic(rs.getString(4));
				c.setPhoto(rs.getString(5));
				c.setID(rs.getString(6));
				c.setFollow_id(rs.getString(7));
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
	//删除我的评论
	public boolean deleteComment(String comments_id){
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
	//微博数量+1
	public boolean updateAddArticleNum(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet result=null;
		try {
			pst=con.prepareStatement("select article_num from countNum where userid=?");
			pst.setString(1, userid);
			result = pst.executeQuery();
			int s =0;
			if(result.next()){
			 s = result.getInt("article_num");
			}s++;
			pst=con.prepareStatement("update countNum set article_num=? where userid=?");
			pst.setInt(1, s);
			pst.setString(2, userid);
			int i=pst.executeUpdate();
			if(i>0)
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pst);
			close(con);
		}		
		return b;
	}
	//微博数量-1
	public boolean updateSubArticleNum(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet result=null;
		try {
			pst=con.prepareStatement("select article_num from countNum where userid=?");
			pst.setString(1, userid);
			result = pst.executeQuery();
			int s =0;
			if(result.next()){
			 s = result.getInt("article_num");
			}s--;
			pst=con.prepareStatement("update countNum set article_num=? where userid=?");
			pst.setInt(1, s);
			pst.setString(2, userid);
			int i=pst.executeUpdate();
			if(i>0)
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pst);
			close(con);
		}		
		return b;
	}
	//关注数量+1
	public boolean updateAddFollowNum(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet result=null;
		try {
			pst=con.prepareStatement("select follow_num from countNum where userid=?");
			pst.setString(1, userid);
			result = pst.executeQuery();
			int s =0;
			if(result.next()){
			 s = result.getInt("follow_num");
			}s++;
			pst=con.prepareStatement("update countNum set follow_num=? where userid=?");
			pst.setInt(1, s);
			pst.setString(2, userid);
			int i=pst.executeUpdate();
			if(i>0)
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pst);
			close(con);
		}		
		return b;
	}
	//关注数量-1
	public boolean updateSubFollowNum(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet result=null;
		try {
			pst=con.prepareStatement("select follow_num from countNum where userid=?");
			pst.setString(1, userid);
			result = pst.executeQuery();
			int s =0;
			if(result.next()){
			 s = result.getInt("follow_num");
			}s--;
			pst=con.prepareStatement("update countNum set follow_num=? where userid=?");
			pst.setInt(1, s);
			pst.setString(2, userid);
			int i=pst.executeUpdate();
			if(i>0)
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pst);
			close(con);
		}		
		return b;
	}
	//粉丝数量+1
	public boolean updateAddFanNum(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet result=null;
		try {
			pst=con.prepareStatement("select fan_num from countNum where userid=?");
			pst.setString(1, userid);
			result = pst.executeQuery();
			int s =0;
			if(result.next()){
			 s = result.getInt("fan_num");
			}s++;
			pst=con.prepareStatement("update countNum set fan_num=? where userid=?");
			pst.setInt(1, s);
			pst.setString(2, userid);
			int i=pst.executeUpdate();
			if(i>0)
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pst);
			close(con);
		}		
		return b;
	}
	//粉丝数量-1
	public boolean updateSubFanNum(String userid){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet result=null;
		try {
			pst=con.prepareStatement("select fan_num from countNum where userid=?");
			pst.setString(1, userid);
			result = pst.executeQuery();
			int s =0;
			if(result.next()){
			 s = result.getInt("fan_num");
			}s--;
			pst=con.prepareStatement("update countNum set fan_num=? where userid=?");
			pst.setInt(1, s);
			pst.setString(2, userid);
			int i=pst.executeUpdate();
			if(i>0)
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			close(pst);
			close(con);
		}		
		return b;
	}
	//显示微博、关注、粉丝数量
	public CountNum getNum(String userid){
		CountNum cn=new CountNum();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from countNum where userid=?");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			while(rs.next()){
				cn.setArticle_num(rs.getString(1));
				cn.setFollow_num(rs.getString(2));
				cn.setFan_num(rs.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return cn;
	}
	//一条微博详情
	public Articles getArticleDetail(String article_id){
		Articles a=new Articles();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select article_id,article_content,article_pic,photo,articles.userid from articles,m_userinfo where articles.userid=m_userinfo.userid and articles.article_id=?");
			pst.setString(1, article_id);
			rs=pst.executeQuery();
			while(rs.next()){
				a.setArticle_id(rs.getString(1));
				a.setArticle_content(rs.getString(2));
				a.setArticlePic(rs.getString(3));
				a.setPhoto(rs.getString(4));
				a.setID(rs.getString(5));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return a;
	}
	//添加转发内容
	public boolean addForwardDetail(AddForwardDetailForm u,String ID){
		boolean b = false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("insert into forward values(?,?,?,?)");
			pst.setString(1,u.getForward_id());
			pst.setString(2,u.getForward_content());
			pst.setString(3,u.getArticle_id());
			pst.setString(4,ID);
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
	//显示转发的微博
	public ArrayList<Forward> getForwardArticles(String ID){
		ArrayList<Forward> af=new ArrayList<Forward>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select forward_id,forward_content,forward.article_id,articles.userid,article_content,article_pic from forward,articles where forward.article_id=articles.article_id and forward.userid=?");
			pst.setString(1, ID);
			rs=pst.executeQuery();
			while(rs.next()){
				Forward f=new Forward();
				f.setForward_id(rs.getString(1));
				f.setForward_content(rs.getString(2));
				f.setArticle_id(rs.getString(3));
				f.setID(rs.getString(4));
				f.setArticle_content(rs.getString(5));
				f.setArticlePic(rs.getString(6));
				af.add(f);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return af;
	}
	//显示@我的
	public ArrayList<Forward> getAtMyArticles(String ID){
		ArrayList<Forward> af=new ArrayList<Forward>();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select forward_id,forward_content,forward.article_id,article_content,article_pic,forward.userid,photo from forward,articles,m_userinfo where forward.article_id=articles.article_id and forward.userid=m_userinfo.userid and articles.userid=?");
			pst.setString(1, ID);
			rs=pst.executeQuery();
			while(rs.next()){
				Forward f=new Forward();
				f.setForward_id(rs.getString(1));
				f.setForward_content(rs.getString(2));
				f.setArticle_id(rs.getString(3));
				f.setArticle_content(rs.getString(4));
				f.setArticlePic(rs.getString(5));
				f.setID(rs.getString(6));
				f.setPhoto(rs.getString(7));
				af.add(f);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return af;
	}
	//删除我转发的
	public boolean deleteForward(String forward_id){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("delete from forward where forward_id=?");
			pst.setString(1, forward_id);
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
}
