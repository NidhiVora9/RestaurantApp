package com.main.DBO;

import java.sql.Statement;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.main.dto.Order;
import com.main.dto.User;
import com.utillities.DBOperation;

public class MenuDBO {

	public Order.Item get_item(int id) throws ClassNotFoundException, SQLException {
		Connection con = DBOperation.get_Connection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
				"Select m.menu_id,m.MENU_NAME,m.MENU_DESCRIPTION,m.MENU_IMAGEURL,m.MENU_PRICE,c.CATEGORY_NAME from RA_Menu m,RA_Menu_Category c where m.CATEGORY_ID= c.CATEGORY_ID and m.MENU_ID ="
						+ id);

		Order.Item item = null;

		if (rs.next()) {
			item = new Order.Item();
			item.setId(rs.getInt(1));
			item.setName(rs.getString(2));
			item.setDescription(rs.getString(3));
			item.setImageURL(rs.getString(4));
			item.setPrice(rs.getFloat(5));
			item.setCategory(rs.getString(6));

		}

		return item;
	}

}
