package com.main.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signout
 */
@WebServlet("/signout")
public class Signout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Signout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("usero", null);
		session.invalidate();
		
		String referrer = request.getHeader("referer");
//		//String pathInfo = request.getRequestURL().toString();
		String[] r = referrer.split("/");
//		System.out.println("Path="+referrer);
		System.out.println("Path="+r[r.length-1]);
		RequestDispatcher rd = request.getRequestDispatcher(r[r.length-1]);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
