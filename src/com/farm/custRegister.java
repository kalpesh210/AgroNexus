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

import com.farm.DbConnection;

/**
 * Servlet implementation class custRegister
 */
@WebServlet("/custRegister")
public class custRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public custRegister() {
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
		String cname=request.getParameter("cname");
		String ccontact=request.getParameter("ccontact");
		String cemail=request.getParameter("cemail");
		String cusername=request.getParameter("cusername");
		String caddress=request.getParameter("caddress");
		String cpassword=request.getParameter("cpassword");
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
			stmt.setInt(1, 0);
			stmt.setString(2, cname);
			stmt.setString(3, ccontact);
			stmt.setString(4, cemail);
			stmt.setString(5, cusername);
			stmt.setString(6, caddress);
			stmt.setString(7, cpassword);
			 int i=stmt.executeUpdate();
			  if(i>0)
			    {
          	  response.sendRedirect("crSuccess.html");
		    	 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
