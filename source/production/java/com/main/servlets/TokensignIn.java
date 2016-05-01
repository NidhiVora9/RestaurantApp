package com.main.servlets;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

/**
 * Servlet implementation class TokensignIn
 */
@WebServlet("/tokensignin")
public class TokensignIn extends HttpServlet {

	static final String CLIENT_ID = "489628980129-la6j4togkesoj56vb77n1ov1fgnhop8j.apps.googleusercontent.com"; 

    public TokensignIn() {
        super(); 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Get method called");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Post method called");
	
		String idTokenString = request.getParameter("idtoken");
		System.out.println(idTokenString);
		HttpTransport transport = new NetHttpTransport(); 
		JsonFactory jsonFactory = JacksonFactory.getDefaultInstance(); 
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
			    .setAudience(Arrays.asList(CLIENT_ID))
			    .setIssuer("accounts.google.com")
			    .build();

			// (Receive idTokenString by HTTPS POST)

			GoogleIdToken idToken;
			try {
				idToken = verifier.verify(idTokenString);
				if (idToken != null) {
					  Payload payload = idToken.getPayload();

					  // Print user identifier
					  String userId = payload.getSubject();
					  System.out.println("User ID: " + userId);

					  // Get profile information from payload
					  String email = payload.getEmail();
					  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
					  String name = (String) payload.get("name");
					  String pictureUrl = (String) payload.get("picture");
					  String locale = (String) payload.get("locale");
					  String familyName = (String) payload.get("family_name");
					  String givenName = (String) payload.get("given_name");

					  // Use or store profile information
					  // ...
					  System.out.println(email+" has signedin");
					  System.out.println(name+" has signedin");
					  response.getWriter().write(name+","+pictureUrl);

					} else {
					  System.out.println("Invalid ID token.");
					}
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

}
