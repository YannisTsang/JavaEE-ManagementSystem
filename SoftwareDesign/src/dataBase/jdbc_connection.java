package dataBase;
import java.sql.*;
public class jdbc_connection {

	public static Connection getConn(){
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydata?"+"useUnicode=true&characterEncoding=gbk","root","Yannis55zyz");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static Statement getStmt(Connection conn){
		Statement stmt=null;
		try {
			if(conn!=null){
			stmt=conn.createStatement();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stmt;
	}
	
	
	public static ResultSet getRs(Statement stmt,String sql){
		ResultSet rs=null;
		try {
		if(stmt!=null){
				rs=stmt.executeQuery(sql);
		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return rs;
		
	}
	
	public static void close(ResultSet rs){
		try{
			if(rs!=null){
				rs.close();
				rs=null;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	

	public static void close(Statement stmt){
		try{
			if(stmt!=null){
				stmt.close();
				stmt=null;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	

	public static void close(Connection conn){
		try{
			if(conn!=null){
				conn.close();
				conn=null;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
