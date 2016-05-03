package com.main.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.dto.User;

/**
 * Servlet implementation class Chatdirector
 */
@WebServlet("/chatdirector")
public class Chatdirector extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Chatdirector() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		if(session != null)
		{
		User user = (User)session.getAttribute("usero");
		if(user == null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/jsp/Chat_No_User.jsp");
			rd.forward(request, response);
		}
		else
		{
			String ip = java.net.InetAddress.getLocalHost().getHostAddress();
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/Chat.jsp?user=" + user.getName() +
					"&ip=" + ip + "&img=" + user.getImageURL());
			rd.forward(request, response);

		}
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/jsp/Chat_No_User.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
