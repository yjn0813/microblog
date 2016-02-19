package Business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BaseBusyness {
	//存放Connection对象的数组，数组被看成连接池
	static ArrayList<Connection> list=new ArrayList<Connection>();
	//从连接池中取出一个连接对象
	public synchronized static  Connection getOneCon(){
		//如果连接池中有连接对象
		if(list.size()>0){
			return list.remove(0);
		}
		//连接池没有连接对象创建连接放到连接池中
		else{
			for(int i=0;i<5;i++){
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","yjn");
					list.add(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return list.remove(0);
		}
	}
	//关闭结果集对象
	public static void close(ResultSet rs){
		try {
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//关闭预处理语句
	public static void close(PreparedStatement ps){
		try {
			if(ps!=null)
				ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//把连接对象放回连接池中
	public synchronized static void close(Connection con){
			if(con!=null)
				list.add(con);
	}
	//主键产生器
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
}
