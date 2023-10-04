package com.farm;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class farmersOrder
 */
@WebServlet("/farmersOrder")
@MultipartConfig(maxFileSize = 1024*1024*10,
fileSizeThreshold=1024*1024*2,	
maxRequestSize=1024*1024*50) 
public class farmersOrder extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname=request.getParameter("pname");
		int pprice=Integer.parseInt(request.getParameter("pprice"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		String address=request.getParameter("address");
		String pcategory=request.getParameter("pcategory");
		String fname=request.getParameter("fname");
		
		String ptype=request.getParameter("ptype");
		int aid=Integer.parseInt(request.getParameter("aid"));

		String base64ImageData = request.getParameter("imageData");
        byte[] imageBytes = Base64.getDecoder().decode(base64ImageData);
        InputStream imageData = new ByteArrayInputStream(imageBytes);
        
		 Connection con=DbConnection.connect();
		 PreparedStatement stmt; 
		 int id=0;
		try {
			
			stmt = con.prepareStatement("insert into farmerorder values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setInt(1, 0);			
			stmt.setInt(2, pid);
			stmt.setInt(3, Data.getFid());
			stmt.setInt(4, aid);
			stmt.setString(5, pname);
			stmt.setInt(6, pprice);
			stmt.setInt(7, quantity);
			stmt.setString(8, fname);
	    	stmt.setString(9, address);
	    	stmt.setInt(10, pincode);
	    	stmt.setString(11, pcategory);
	    	stmt.setString(12, ptype);
	    	stmt.setInt(13, pprice*quantity);
	    	stmt.setBlob(14, imageData);
			 int i=stmt.executeUpdate();
			  
			  if(i>0)
			    {
				  ResultSet rs = stmt.getGeneratedKeys();
	                if (rs.next()) {
	                    id = rs.getInt(1);
	                }
				  response.sendRedirect("farmersOrder.jsp?id="+id);
	            }
			
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
