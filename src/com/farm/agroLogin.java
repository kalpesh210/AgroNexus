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
import javax.servlet.http.HttpSession;

import com.farm.Value;
import com.farm.Data;

/**
 * Servlet implementation class agroLogin
 */
@WebServlet("/agroLogin")
public class agroLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public agroLogin() {
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
	
		 String aemail = request.getParameter("aemail");
		 String apassword =  request.getParameter("apassword");
	
   	PreparedStatement ps;
			try {
				ps = con.prepareStatement("select * from agroagency where aemail=? and apassword = ?");
				ps.setString(1, aemail) ;
				ps.setString(2,apassword);		
			    ResultSet rs=ps.executeQuery();
			   if(rs.next())
			   {			   	
				   Data.setAid(rs.getInt("aid"));
	            	  response.sendRedirect("agroDash1.jsp");
			   }else{
				   response.sendRedirect("aLogin.html");
			   }
			  			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}