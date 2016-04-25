package com.utillities;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;

public class Prop{
		
		static Properties user;
		static Properties preferences;
		static String upath="";
		static String ppath="";
		
		private Prop(){
			
		}
		
//		public synchronized static Properties set_getUser(ServletContext context)
//		{
//			getUser(context);
//			
//			setUser(context);
//			return user;
//		}
		
		public synchronized static Properties getUser(ServletContext context) {
			if(user == null)
			{
				user=new Properties();
				upath= context.getInitParameter("user_properties_path");
		    	 
				try {
		    	System.out.println("Loading properties file");	
					user.load(context.getResourceAsStream(upath));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return user;
			
		}
	
		public synchronized static void setUser(ServletContext context) {
			
			FileOutputStream fileOut;
			try { 
				fileOut = new FileOutputStream(context.getRealPath(upath));
				user.store(fileOut, "Added at signup");
				fileOut.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public synchronized static Properties getPreferences(ServletContext context) {
			if(preferences == null)
			{
				preferences=new Properties();
				ppath= context.getInitParameter("preference_properties_path");
		    	try {
		    	System.out.println("Loading properties file");	
		    	preferences.load(context.getResourceAsStream(ppath));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return preferences;
		}
		
		public synchronized static void setPreferences(ServletContext context) {
			FileOutputStream fileOut;
			try { 
				fileOut = new FileOutputStream(context.getRealPath(ppath));
				preferences.store(fileOut, "Changed by user");
				fileOut.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
}
