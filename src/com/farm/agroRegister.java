package com.farm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class agroRegister
 */
@WebServlet("/agroRegister")
public class agroRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public agroRegister() {
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
		String aname=request.getParameter("aname");
		String acontact=request.getParameter("acontact");
		String aemail=request.getParameter("aemail");
		String ausername=request.getParameter("ausername");
		String aaddress=request.getParameter("alocation");
		String apassword=request.getParameter("apassword");
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into agroagency values(?,?,?,?,?,?,?)");
			stmt.setInt(1, 0);
			stmt.setString(2, aname);
			stmt.setString(3, acontact);
			stmt.setString(4, aemail);
			stmt.setString(5, ausername);
			stmt.setString(6, aaddress);
			stmt.setString(7, apassword);
			 int i=stmt.executeUpdate();
			  if(i>0)
			    {
          	  response.sendRedirect("arSuccess.html");
		    	 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
