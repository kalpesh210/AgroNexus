package com.farm;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
 * Servlet implementation class addSeeds
 */

@WebServlet("/addSeeds")
@MultipartConfig(maxFileSize = 1024*1024*10,
fileSizeThreshold=1024*1024*2,	
maxRequestSize=1024*1024*50) 
public class addSeeds extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String sname=request.getParameter("sname");
		String scategory=request.getParameter("scategory");
		int sprice=Integer.parseInt(request.getParameter("sprice"));
		int sstock=Integer.parseInt(request.getParameter("sstock"));
		String sdescription=request.getParameter("sdescription");
		   Part part = request.getPart("simage");
	 
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into seeds values(?,?,?,?,?,?,?,?)");
			
			stmt.setInt(1, 0);
			stmt.setString(2, sname);
			stmt.setString(3, sdescription);
			stmt.setInt(4, sprice);
			stmt.setInt(5, sstock);
			 InputStream inputStream = part.getInputStream();
	        stmt.setBlob(6, inputStream);
	    	stmt.setInt(7, Data.getAid());
	    	stmt.setString(8, scategory);
			 int i=stmt.executeUpdate();
			  if(i>0)
			    {
				  response.sendRedirect("agroDash1.jsp");
		    	 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
