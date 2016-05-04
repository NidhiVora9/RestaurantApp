package com.utillities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOperation {

static Connection con;	
	

public static Connection get_Connection() throws ClassNotFoundException, SQLException{
	if(con == null)
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:reslife", "system", "Parth8891");
		return con;
	}
	else
		return con;
}


}
