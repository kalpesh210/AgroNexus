 package com.farm;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class cancelCustOrder
 */
@WebServlet("/cancelCustOrder")
public class cancelCustOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelCustOrder() {
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
		
	
	System.out.println(Data.getOid());
	System.out.println(Data.getFid());
	System.out.println(Data.getCid());
		String reason=request.getParameter("reason");
		String suggestions=request.getParameter("suggestions");
	
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into cancelcustorder values(?,?,?,?,?,?)");
			
			stmt.setInt(1, 0);
			stmt.setInt(2, Data.getCid());
			stmt.setInt(3, Data.getFid());
			stmt.setString(4, reason);
			stmt.setString(5, suggestions);
			stmt.setInt(6, Data.getOid());
  
			 int i=stmt.executeUpdate();
			  
			  if(i>0)
			    {
				  response.sendRedirect("cancelOrder1.jsp");
	            }
			
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
