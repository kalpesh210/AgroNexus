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
 * Servlet implementation class farmRegister
 */
@WebServlet("/farmRegister")
public class farmRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public farmRegister() {
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
		String fname=request.getParameter("fname");
		String fcontact=request.getParameter("fcontact");
		String femail=request.getParameter("femail");
		String fusername=request.getParameter("fusername");
		String faddress=request.getParameter("faddress");
		String fpassword=request.getParameter("fpassword");
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into farmer values(?,?,?,?,?,?,?)");
			stmt.setInt(1, 0);
			stmt.setString(2, fname);
			stmt.setString(3, fcontact);
			stmt.setString(4, femail);
			stmt.setString(5, fusername);
			stmt.setString(6, faddress);
			stmt.setString(7, fpassword);
			 int i=stmt.executeUpdate();
			  if(i>0)
			    {
          	  response.sendRedirect("frSuccess.html");
		    	 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
