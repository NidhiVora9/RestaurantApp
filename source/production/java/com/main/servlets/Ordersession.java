package com.main.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.main.DBO.MenuDBO;
import com.main.dto.Order;

/**
 * Servlet implementation class Ordersession
 */
@WebServlet("/ordersession")
public class Ordersession extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ordersession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int oid = Integer.parseInt(request.getParameter("id"));
		MenuDBO mdb = new MenuDBO();
		try {
			Order.Item item = mdb.get_item(oid);
			if(item != null)
			{
			HttpSession session = request.getSession(false);
			if (session != null) {
			 Order o = (Order)session.getAttribute("order");
				if(o == null)
				{
				 o = new Order();
				 o.additem(item);
				}
				else
				{
				  o.additem(item);
				}
				System.out.println(item.getName()+" has been added in session");
				session.setAttribute("order", o);
				response.getWriter().write(item.getName());

			}
			}
			else
			{
				response.getWriter().write("-1");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
