        
<%@ page import="java.sql.*" %>
<%@ page import="com.farm.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Base64" %>

<html lang="en">
   

<head>
      <meta http-equiv="Content-Type" content="text/html ; charset= UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="icon" href="images/favicon.png">
      <title>ECO HTML</title>
      <!-- CSS FILES START -->
      <link href="css/custom.css" rel="stylesheet">
      <link href="css/color.css" rel="stylesheet">
      <link href="css/responsive.css" rel="stylesheet">
      <link href="css/owl.carousel.min.css" rel="stylesheet">
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/prettyPhoto.css" rel="stylesheet">
      <link href="css/all.min.css" rel="stylesheet">
      <!-- CSS FILES End -->
      <style>
  
        .order-details {
            border: 2px solid green;
            padding: 20px;
            max-width: 400px;
            margin: 0 auto;
                margin-bottom: 38px;
            
        }
        .order-details h2 {
            color: green;
        }
        .order-details p {
            margin: 5px 0;
        }
      
        .success-message {
            text-align: center;
            margin: 23px auto;
        }
        .checkmark {
            display: inline-block;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #00FF00;
            position: relative;
        }
        .checkmark::after {
            content: '';
            position: absolute;
            top: 45%;
            left: 22%;
              width: 28%;
   			 height: 61%;
            border: solid white;
            border-width: 0 12px 12px 0;
            transform: rotate(45deg);
            margin-top: -25px;
            margin-left: 12px;
        }
        .message {
            font-size: 24px;
            color: #00FF00;
            margin-top: 20px;
        }
     
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            color: green;
        }

        table {
    border-collapse: collapse;
    width: 80%;
    margin-left: 118px;
    margin-top: 30px;
    margin-bottom: 34px;
}

       th, td {
padding: 4px;
    text-align: center;
    border-left: 4px solid #ddd;
    border-top: 4px solid #ddd; 
    border-bottom: 4px solid #ddd;
    border-right: 4px solid #ddd;
    color: black;

        th {
            background-color: green;
            color: white;
                
        }

        img {
            max-width: 100px;
            max-height: 100px;
        }
    </style>
       
   </head>
   <body>

     <%
     int id = Data.getAid();
	  Connection con = DbConnection.connect();
	  PreparedStatement stmt = con.prepareStatement("select * from farmerorder where aid=? and ptype=?");
	  stmt.setInt(1,id);
	  stmt.setString(2,"Fertilizers");
	  ResultSet rs = stmt.executeQuery();
	
	  
	  %>
	  

<div class="wrapper home2">
         <!--Header Start-->
         <header class="header-style-2">
            <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="index.html" style="padding: 0px 0;"><img src="images/hmlogo.png" alt="" ></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <i class="fas fa-bars"></i> </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                  
                   <li class="nav-item"> <a class="nav-link" href="agroDash1.jsp">Home</a> </li>
                   
                      <li class="nav-item"> <a class="nav-link" href="addSeeds.html">Add Seeds</a> </li>
                
                
                   
                      <li class="nav-item"> <a class="nav-link" href="addFertilizers.html">Add Fertilizers</a> </li>
                    
                        <li class="nav-item"> <a class="nav-link" href="viewAgroO.html">View Order's</a> </li>
                   
                     
                      <li class="nav-item"> <a class="nav-link" href="about.html">About</a> </li>
                  
                     
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="contact.html"  role="button" aria-haspopup="true" aria-expanded="false"> Contact </a>
                       
                     </li>
                       <li class="nav-item"> <a class="nav-link" href="aLogin.html">Logout</a> </li>
             
                  </ul>
                  
               </div>
            </nav>
         </header>
     
        
    <div>
			     <table>
			        <tr>
			            <th>Order ID</th>
			            <th>Product</th>
			            <th>Name</th>
			            <th>Price</th>
			            <th>Quantity</th>
			            <th>Farmer Name</th>
			            <th>Address</th>
			            <th>Category</th>
			            <th>Total</th>
			     
			        </tr>
			       
			      <%while(rs.next())
	            { 
			    	  Blob productImageBlob = rs.getBlob("pimage");
			          byte[] productImageBytes = productImageBlob.getBytes(1, (int) productImageBlob.length());
			          String base64Image = Base64.getEncoder().encodeToString(productImageBytes); 
	            
	            %>
			        <tr>
			            <td><%=rs.getInt("oid")%></td>
			            <td><img src="data:image/png;base64,<%= base64Image %>"  width="100"  height="70" alt=""></td>
			            <td><%=rs.getString("pname")%></td>
			            <td><%=rs.getInt("pprice")%></td>
			            <td><%=rs.getInt("quantity")%></td>
			            <td><%=rs.getString("fname")%></td>         
			            <td><%=rs.getString("address")%></td>
			            <td><%=rs.getString("pcategory")%></td>
			            <td><%=rs.getInt("total")%></td>
			       
			         
			      
			        </tr>
			    
        <%} %>
			    </table>
    
        </div>
        
   <!--Footer Start-->
         <footer class="footer">
            <div class="footer-top wf100">
               <div class="container">
                  <div class="row">
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>About AgroNexus</h4>
                           <p>AgroNexus is a dynamic platform that seamlessly connects farmers, agro agencies and customers. AgroNexus empowers farmers and fosters sustainable practices. Discover a smarter way to cultivate success with AgroNexus.
                            </p>
                           <a href="about.html" class="lm">About us</a> 
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>Useful Links</h4>
                           <ul class="quick-links">
                              <li><a href="knowledgeHub.html">Knowledge Hub</a></li>
                              <li><a href="community.html">Community and Networking</a></li>
                             
                           
                           </ul>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                          <h4>Services For</h4>
                           <ul class="quick-links">
                              <li><a href="fLogin.html">Farmer's</a></li>
                              <li><a href="cLogin.html">Customer's</a></li>
                              <li><a href="aLogin.html">Agro Agency's </a></li>
                              </ul>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                          <h4>Connect With Us</h4>
                           <ul class="quick1">
                              <li style="font-weight: 900;color: #fff;font-family: 'Roboto', sans-serif;">Stay Connected</li>
                                  <li style="font-weight: 900;color: #fff;font-family: 'Roboto', sans-serif;">Stay Updated</li>
                                  <br>
								              <div class="social-icons">
								  <a href="#" class="icon-link"><i class="fab fa-facebook-f"></i></a>
								  <a href="#" class="icon-link"><i class="fab fa-twitter"></i></a>
								  <a href="#" class="icon-link"><i class="fab fa-instagram"></i></a>
								  <a href="#" class="icon-link"><i class="fab fa-linkedin-in"></i></a>
								  <a href="#" class="icon-link"><i class="fab fa-youtube"></i></a>
								</div>

                                  
                              </ul>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                  </div>
               </div>
            </div>
            
         </footer>
         <!--Footer End--> 
      </div>
      <!--   JS Files Start  --> 
      <script src="js/jquery-3.3.1.min.js"></script> 
      <script src="js/jquery-migrate-1.4.1.min.js"></script> 
      <script src="js/popper.min.js"></script> 
      <script src="js/bootstrap.min.js"></script> 
      <script src="js/owl.carousel.min.js"></script> 
      <script src="js/jquery.prettyPhoto.js"></script> 
      <script src="js/isotope.min.js"></script> 
      <script src="js/custom.js"></script>
   </body>


</html>