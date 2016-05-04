package com.main.filters;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.main.DBO.UserDBO;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		System.out.println("Entered login filter");
		String ipAddress = ((HttpServletRequest) request).getHeader("X-FORWARDED-FOR");
		
		if (ipAddress == null)
			ipAddress = request.getRemoteAddr();
		
		DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
		Date now = new Date();		
		String visited_on = df.format(now).toString();
		UserDBO udb = new UserDBO();
		try {
			if (!udb.checkIP(ipAddress, visited_on)) {
				udb.insertTrackUser(ipAddress, visited_on);
			}
			else
			{
				udb.UpdatetrackUser(ipAddress, visited_on);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
