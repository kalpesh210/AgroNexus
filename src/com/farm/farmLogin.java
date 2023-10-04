package com.farm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class farmLogin
 */
@WebServlet("/farmLogin")
public class farmLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public farmLogin() {
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
		doGet(request, response);
		Connection con =	DbConnection.connect();
		
		 String femail = request.getParameter("femail");
		 String fpassword =  request.getParameter("fpassword");
	
  	PreparedStatement ps;
			try {
				ps = con.prepareStatement("select * from farmer where femail=? and fpassword = ?");
				ps.setString(1, femail) ;
				ps.setString(2, fpassword);		
			    ResultSet rs=ps.executeQuery();
			   if(rs.next())
			   {			   	
				   Data.setFid(rs.getInt("fid"));
	            	  response.sendRedirect("farmDash1.jsp");
			   }else{
				   response.sendRedirect("fLogin.html");
			   }
			  			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}