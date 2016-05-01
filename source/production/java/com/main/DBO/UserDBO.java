package com.main.DBO;

import java.sql.Statement;

import javax.naming.spi.DirStateFactory.Result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.main.dto.User;
import com.utillities.DBOperation;

public class UserDBO {


	
public int insertUser(User u) throws ClassNotFoundException, SQLException
{
Connection con = DBOperation.get_Connection();
PreparedStatement ps = con.prepareStatement("insert into RA_User values(?,?,?,?)");
ps.setString(1, u.getEmail());
ps.setString(2, u.getGivenName());
ps.setString(3, u.getFamilyName());
ps.setString(4, u.getImageURL());

int ret= ps.executeUpdate();

System.out.println("inserted user"+ret);
return ret;
}

public boolean check_user(String email) throws ClassNotFoundException, SQLException {
Connection con = DBOperation.get_Connection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("Select * from RA_User where user_id='"+email+"'");

boolean ret = rs.next();
System.out.println("check user"+ret);
return ret;
}

}
