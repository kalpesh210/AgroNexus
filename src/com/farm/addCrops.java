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
 * Servlet implementation class addCrops
 */
@WebServlet("/addCrops")
@MultipartConfig(maxFileSize = 1024*1024*10,
fileSizeThreshold=1024*1024*2,	
maxRequestSize=1024*1024*50) 
public class addCrops extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String crname=request.getParameter("crname");
		   Part part = request.getPart("crimage");
	 
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into crops values(?,?,?)");
			
			stmt.setInt(1, 0);
			stmt.setString(2, crname);
		
			 InputStream inputStream = part.getInputStream();
	        stmt.setBlob(3, inputStream);
	   
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
