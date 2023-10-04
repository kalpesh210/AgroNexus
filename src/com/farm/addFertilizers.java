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
 * Servlet implementation class addFertilizers
 */
@WebServlet("/addFertilizers")
@MultipartConfig(maxFileSize = 1024*1024*10,
fileSizeThreshold=1024*1024*2,	
maxRequestSize=1024*1024*50) 
public class addFertilizers extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String ftname=request.getParameter("ftname");
		String ftcategory=request.getParameter("ftcategory");
		int ftprice=Integer.parseInt(request.getParameter("ftprice"));
		int ftstock=Integer.parseInt(request.getParameter("ftstock"));
		String ftdescription=request.getParameter("ftdescription");
		   Part part = request.getPart("ftimage");
	 
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into fertilizers values(?,?,?,?,?,?,?,?)");
			
			stmt.setInt(1, 0);
			stmt.setString(2, ftname);
			stmt.setString(3, ftdescription);
			stmt.setInt(4, ftprice);
			stmt.setInt(5, ftstock);
			 InputStream inputStream = part.getInputStream();
	        stmt.setBlob(6, inputStream);
	    	stmt.setInt(7, Data.getAid());
	    	stmt.setString(8, ftcategory);
			 int i=stmt.executeUpdate();
			  if(i>0)
			    {
				  response.sendRedirect("agroDash2.jsp");
		    	 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
