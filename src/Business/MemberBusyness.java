package Business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Entity.Userinfo;

import struts.form.LoginForm;
import struts.form.MemberAddForm;
import struts.form.UpdateMemberDetailForm;


import struts.form.RegistForm;

public class MemberBusyness extends BaseBusyness{
	//判断用户名是否可用
	public boolean isIDnull(RegistForm u){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from m_uTable where userid=?");
			pst.setString(1, u.getID());
			rs=pst.executeQuery();
			if(rs.next()){
				b=false;
			}else{
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
	
	//注册会员
	public boolean registMember(RegistForm u){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement("insert into m_uTable values(?,?)");
			pst.setString(1, u.getID());
			pst.setString(2, u.getPW());
			pst.executeUpdate();
			pst=con.prepareStatement("insert into countNum values(?,?,?,?)");
			pst.setString(1, u.getArticle_num());
			pst.setString(2, u.getFollow_num());
			pst.setString(3, u.getFan_num());
			pst.setString(4, u.getID());
			int n=pst.executeUpdate();
			if(n>0){
				b=true;
			}else{
				b=false;
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
	
	//会员登录
	public boolean loginMember(LoginForm u){
		boolean b=false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from m_uTable where userid=? and password=?");
			pst.setString(1, u.getID());
			pst.setString(2, u.getPW());
			rs=pst.executeQuery();
			if(rs.next()){
				b=true;
				
			}else{
				
				b=false;
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
	
	//管理员登陆
	public boolean loginAdmin(LoginForm u)
    {
        boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try
        {
            pst = con.prepareStatement("select * from adminuser where adminid=? and adminpass=?");
            pst.setString(1, u.getID());
            pst.setString(2, u.getPW());
            rs = pst.executeQuery();
            if(rs.next())
                b = true;
            else
                b = false;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }finally{
        close(rs);
        close(pst);
        close(con);
    }
        return b;
    }
	
	//添加会员详细资料
	public boolean memberInfo(MemberAddForm u,String bp){
		boolean b = false;
        Connection con = getOneCon();
        PreparedStatement pst = null;
        try {
			pst = con.prepareStatement("insert into m_userinfo values(?,?,?,?,to_date(?,'YYYY-MM-DD'),?,?,?)");
			pst.setString(1,u.getMail());
			pst.setString(2, u.getSex());
			pst.setString(3, bp);
			pst.setString(4,u.getAddress());
			pst.setString(5, u.getBirthday());
			pst.setString(6,u.getBlood());
			pst.setString(7,u.getProfile());
			pst.setString(8, u.getID());
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
	//查询会员详细资料
	public Userinfo getMemberDetail(String userid){
		Userinfo ui=new Userinfo();
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("select * from m_userinfo where userid=?");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			while(rs.next()){
		
				ui.setMail(rs.getString(1));
				ui.setSex(rs.getString(2));
				ui.setPhoto(rs.getString(3));
				ui.setAddress(rs.getString(4));
				ui.setBirthday(rs.getString(5).substring(0,10));
				ui.setBlood(rs.getString(6));
				ui.setProfile(rs.getString(7));
				ui.setID(rs.getString(8));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pst);
			close(con);
		}
		return ui;
	}
	//修改会员详细资料
	public boolean updateMemberDetail (UpdateMemberDetailForm u,String bp){
		boolean b = false;
		Connection con=getOneCon();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement("update m_userinfo set mail=?,sex=?,photo=?,address=?,birthday=to_date(?,'YYYY-MM-DD'),blood=?,profile=? where userid=?");
			pst.setString(1,u.getMail());
			pst.setString(2, u.getSex());
			pst.setString(3, bp);
			pst.setString(4,u.getAddress());
			pst.setString(5, u.getBirthday());
			pst.setString(6,u.getBlood());
			pst.setString(7,u.getProfile());
			pst.setString(8, u.getID());
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

