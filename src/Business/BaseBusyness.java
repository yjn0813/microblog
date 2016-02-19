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
	//���Connection��������飬���鱻�������ӳ�
	static ArrayList<Connection> list=new ArrayList<Connection>();
	//�����ӳ���ȡ��һ�����Ӷ���
	public synchronized static  Connection getOneCon(){
		//������ӳ��������Ӷ���
		if(list.size()>0){
			return list.remove(0);
		}
		//���ӳ�û�����Ӷ��󴴽����ӷŵ����ӳ���
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
	//�رս��������
	public static void close(ResultSet rs){
		try {
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//�ر�Ԥ�������
	public static void close(PreparedStatement ps){
		try {
			if(ps!=null)
				ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//�����Ӷ���Ż����ӳ���
	public synchronized static void close(Connection con){
			if(con!=null)
				list.add(con);
	}
	//����������
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
}
