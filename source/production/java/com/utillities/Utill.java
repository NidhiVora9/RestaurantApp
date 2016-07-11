package com.utillities;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Utill { 
	 
	 public static void check_session(HttpServletRequest req,HttpServletResponse res) throws IOException
	 {
		 if(req.getSession()==null)
		 {
			 res.sendRedirect("login");
		 } 
	 }
	 
	 public static String get_head()
	 {
		return "<html> <head> <meta charset=\"ISO-8859-1\"> <title>Session App</title> <link rel=\"import\" href=\"navbar.html\"> <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\"><script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script> <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script> <script src=\"/js/login.js\"></script> </head> <body><div class=\"container\"><nav class=\"navbar navbar-inverse\"> <div class=\"container-fluid\"> <ul class=\"nav navbar-nav navbar-right\"> <li><a href=\"logout\">Logout</a></li> </ul> </div> </nav>"; 
	 }
	 
	 public static String get_tail()
	 {
		return "</div></body></html>"; 
	 }
}
