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

import com.farm.Data;
import com.farm.DbConnection;

/**
 * Servlet implementation class custLogin
 */
@WebServlet("/custLogin")
public class custLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public custLogin() {
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
		 String cemail = request.getParameter("cemail");
		 String cpassword =  request.getParameter("cpassword");
		
   	PreparedStatement ps;
			try {
				ps = con.prepareStatement("select * from customer where cemail=? and cpassword = ?");
				ps.setString(1, cemail);
				ps.setString(2,cpassword);
			   ResultSet rs=ps.executeQuery();
			    System.out.println(cemail+" "+cpassword);
			   if(rs.next())
			   {
				   	Data.setCid(rs.getInt("cid"));
	            	  response.sendRedirect("custDash.jsp");
			   }else{
				   response.sendRedirect("contact.html");
			   }
			  			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}