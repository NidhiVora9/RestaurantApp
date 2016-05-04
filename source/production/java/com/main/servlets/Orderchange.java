package com.main.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.dto.Order;

/**
 * Servlet implementation class Orderchange
 */
@WebServlet("/orderchange")
public class Orderchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Orderchange() {
        super();        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = (String)request.getParameter("orderid");
		System.out.println("changing order"+id);

			HttpSession session = request.getSession(false);
			if (session != null) {
			 Order o = (Order)session.getAttribute("order");
				if(o != null)
				{
				  o.increment(Integer.parseInt(id));
				}
				System.out.println(id+" has been cahnged in session");
				session.setAttribute("order", o);
		
			}
			response.getWriter().write("200");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
