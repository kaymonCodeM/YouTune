package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcManager {

	private String jdbcUrl;  //Database URL
	private String jdbcUserName;  // User Name
	private String jdbcPassword;  //Password
	
	
	//Constructor
	public JdbcManager() 
	{
		jdbcUrl = "jdbc:mysql://localhost:3306/youtunes";
		jdbcUserName = "youtunes_user";
		jdbcPassword = "pass";
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (ClassNotFoundException ex)
		{
			System.out.println(ex.toString());
		}
	}
	
	//Connect to Database
	public Connection getConn() 
	{
		Connection conn = null;
		
		System.out.println("jdbcUrl: " + jdbcUrl + "; jdbcUserName: " + jdbcUserName + "; jdbcPassword: " + jdbcPassword);
		
		try 
		{
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		}
		catch (SQLException ex) 
		{
			System.out.println("Could not connect to DB");
		}
		
		return conn;
	}
	
	//Close Connection
	public void closeConn(Connection conn) 
	{
		if (conn != null) 
		{
			try 
			{
				conn.close();
			}
			catch (SQLException ex)
			{
				System.out.println("Could not close DB connection");
			}
		}
	}
	
}
