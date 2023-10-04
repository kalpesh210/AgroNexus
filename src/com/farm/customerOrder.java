package com.farm;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
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
import javax.servlet.http.Part;

/**
 * Servlet implementation class customerOrder
 */
@WebServlet("/customerOrder")

@MultipartConfig(maxFileSize = 1024*1024*10,
fileSizeThreshold=1024*1024*2,	
maxRequestSize=1024*1024*50) 
public class customerOrder extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String fvname=request.getParameter("fvname");
		String cname=request.getParameter("cname");
		int fvprice=Integer.parseInt(request.getParameter("fvprice"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		int fvid=Integer.parseInt(request.getParameter("fvid"));
		String address=request.getParameter("address");
		String fvcategory=request.getParameter("fvcategory");
		int fid=Integer.parseInt(request.getParameter("fid"));
		String base64ImageData = request.getParameter("imageData");
        byte[] imageBytes = Base64.getDecoder().decode(base64ImageData);
        
        InputStream imageData = new ByteArrayInputStream(imageBytes);

		 Connection con=DbConnection.connect();
		 PreparedStatement stmt; 
		 int id=0;
		try {

			stmt = con.prepareStatement("insert into customerorder values(?,?,?,?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setInt(1, 0);		
			stmt.setInt(2, fvid);
			stmt.setInt(3, Data.getCid());
			stmt.setInt(4, fid);
			stmt.setString(5, fvname);
		    stmt.setInt(6, fvprice);
			stmt.setInt(7, quantity);
			stmt.setString(8, cname);
	    	stmt.setString(9, address);
	    	stmt.setInt(10, pincode);
	    	stmt.setString(11, fvcategory);
	    	stmt.setInt(12, fvprice*quantity);
	    	 stmt.setBlob(13, imageData);
			 int i=stmt.executeUpdate();
			  
			  if(i>0)
			    {
				  ResultSet rs = stmt.getGeneratedKeys();
	                if (rs.next()) {
	                    id = rs.getInt(1);
	                }
				  response.sendRedirect("customerOrder.jsp?id="+id);
	            }
			
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
