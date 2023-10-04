<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.farm.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


    <h1>Agriculture Products</h1>
    <%
    Connection con=DbConnection.connect();
    PreparedStatement stmt;
	try {
		stmt = con.prepareStatement("SELECT * FROM agriculture_products");
          
            ResultSet resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                Blob productImageBlob = resultSet.getBlob("product_image");
                byte[] productImageBytes = productImageBlob.getBytes(1, (int) productImageBlob.length());
                String base64Image = Base64.getEncoder().encodeToString(productImageBytes);
    %>
                <div>
                    <h2><%= productName %></h2>
                    <p><%= productDescription %></p>
                    <img src="data:image/png;base64,<%= base64Image %>" width="250" height="200" alt="<%= productName %>">
                </div>
    <%
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
