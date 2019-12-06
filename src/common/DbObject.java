package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbObject {

	public DbObject() {

	}
	
	public Connection open(){
		Connection cn = null;
		
		
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

	public void close(Connection cn, Statement st, ResultSet rs){
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
