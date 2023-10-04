package com.farm;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addFV
 */
@WebServlet("/addFV")
@MultipartConfig(maxFileSize = 1024*1024*10,
fileSizeThreshold=1024*1024*2,	
maxRequestSize=1024*1024*50) 
public class addFV extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String fvname=request.getParameter("fvname");
		String fvcategory=request.getParameter("fvcategory");
		int fvprice=Integer.parseInt(request.getParameter("fvprice"));
		int fvstock=Integer.parseInt(request.getParameter("fvstock"));
		   Part part = request.getPart("fvimage");
	 
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into fruitsVegetables values(?,?,?,?,?,?,?)");
			
			stmt.setInt(1, 0);
			stmt.setString(2, fvname);
			stmt.setInt(3, fvprice);
			stmt.setInt(4, fvstock);
			 InputStream inputStream = part.getInputStream();
	        stmt.setBlob(5, inputStream);
	    	stmt.setInt(6, Data.getFid());
	    	stmt.setString(7, fvcategory);
			 int i=stmt.executeUpdate();
			  if(i>0)
			    {
				  response.sendRedirect("farmDash1.jsp");
		    	 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
