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
 * Servlet implementation class cancelFarmOrder
 */
@WebServlet("/cancelFarmOrder")
public class cancelFarmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelFarmOrder() {
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
		String reason=request.getParameter("reason");
		String suggestions=request.getParameter("suggestions");
	
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into cancelfarmorder values(?,?,?,?,?,?)");
			
			stmt.setInt(1, 0);
			stmt.setInt(2, Data.getFid());
			stmt.setInt(3, Data.getAid());
			stmt.setString(4, reason);
			stmt.setString(5, suggestions);
			stmt.setInt(6, Data.getOid());
  
			 int i=stmt.executeUpdate();
			  
			  if(i>0)
			    {
				  response.sendRedirect("cancelOrderF1.jsp");
	            }
			
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
