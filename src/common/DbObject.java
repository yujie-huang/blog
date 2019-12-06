package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbObject {
	
	Connection cn = null;//申明连接
	PreparedStatement st = null;
	ResultSet rs = null;

	public DbObject() {

	}
	
	public ResultSet executeQuery(String sql, Object[] param ){
		rs=null; //先令为空，防止出错
		
		//1. 
		try {
			cn = open();
			
			//4. 		
			st = cn.prepareStatement(sql);
			
			for(int i=0;param!=null&& i<param.length;i++){
				st.setObject(i+1, param[i]);
			}
			 rs = st.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return rs;		
	}
	
	public int executeUpdate(String sql, Object param[]) {
		
		int st_num=0; 
		//1. 
		try {
			cn = open();
			
			//4. 		
			st = cn.prepareStatement(sql);
			for(int i=0; i<param.length;i++){
				st.setObject(i+1, param[i]);
			}
			 st_num= st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		close();
		return st_num;		
		
		
	}
	
	
	public Connection open(){
		
		
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
			
			String url = "jdbc:sqlserver://localhost:1433;user=sa;password=123;database=blog";
			
			//3. 
			cn = DriverManager.getConnection(url);
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cn;
	}

	public void close(){
		//
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (st != null)
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (cn != null)
			try {
				cn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
	}

}
