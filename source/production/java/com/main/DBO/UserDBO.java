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

	public int insertUser(User u) throws ClassNotFoundException, SQLException {
		Connection con = DBOperation.get_Connection();
		PreparedStatement ps = con.prepareStatement("insert into RA_User values(?,?,?,?)");
		ps.setString(1, u.getEmail());
		ps.setString(2, u.getGivenName());
		ps.setString(3, u.getFamilyName());
		ps.setString(4, u.getImageURL());
		int ret = ps.executeUpdate();
		return ret;
	}
	public int insertTrackUser(String ip, String visited_on) throws ClassNotFoundException, SQLException {
		Connection con = DBOperation.get_Connection();
		PreparedStatement ps = con
				.prepareStatement("insert into RA_TRACKUSERS values(?," + "TO_TIMESTAMP(?,'yyyy/mm/dd hh24:mi:ss'))");
		ps.setString(1, ip);
		ps.setString(2, visited_on);
		int ret = ps.executeUpdate();
		return ret;
	}

	public int UpdatetrackUser(String ip, String visited_on) throws ClassNotFoundException, SQLException{
		Connection con = DBOperation.get_Connection();
		Statement st= con.createStatement();
		int ret=0;
		try{
			ret= st.executeUpdate("Update RA_TRACKUSERS set visited_on=TO_TIMESTAMP('"+visited_on+"','yyyy/mm/dd hh24:mi:ss') where IPADDRESS='"+ip+"'");
			return ret;
		}
		 catch(SQLException ex)
        {
           System.out.println("Could not update table");
           System.out.println(ex);
        }
		return ret;
	}

	public boolean check_user(String email) throws ClassNotFoundException, SQLException {
		Connection con = DBOperation.get_Connection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from RA_User where user_id='" + email + "'");
		boolean ret = rs.next();
		return ret;
	}

	public boolean checkIP(String ip, String visited_on) throws ClassNotFoundException, SQLException {
		Connection con = DBOperation.get_Connection();
		Statement st = con.createStatement();
		boolean checkUser = false;
		ResultSet rs = st.executeQuery("Select * from RA_TRACKUSERS where IPADDRESS='" + ip + "'");
		return rs.next();
	}
}
