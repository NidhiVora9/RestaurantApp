package com.main.servlets;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.main.DBO.UserDBO;
import com.main.dto.User;
import com.utillities.GoogleValidation;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.apache.http.impl.io.SocketOutputBuffer;

/**
 * Servlet implementation class TokensignIn
 */
@WebServlet("/tokensignin")
public class TokensignIn extends HttpServlet {

	public TokensignIn() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Get method called");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// System.out.println("Post method called");
		String idTokenString = request.getParameter("idtoken");

		GoogleValidation gv = new GoogleValidation();
		User user = gv.validate(idTokenString);

		if (user == null) {
			System.out.println("Invalid User");
			response.getWriter().write("502");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("usero", user);

			UserDBO udb = new UserDBO();
			try {
				if (!udb.check_user(user.getEmail())) {
					udb.insertUser(user);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				response.getWriter().write("200");
			}

			// String referrer = request.getHeader("referer");
			// String[] r = referrer.split("/");
			// System.out.println("Path="+referrer);
			// System.out.println("Path="+r[r.length-1]);
			// response.sendRedirect(r[r.length-1]);
			// rd.forward(request, response);
		}
	}

}
