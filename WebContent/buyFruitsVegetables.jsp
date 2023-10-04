<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
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
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    
        /* Apply styles to the product_description textarea */
        textarea[name="product_description"] {
            /* Default width for smaller screens */
            width: 100%;
            box-sizing: border-box;
        }
textarea {
    width: 449px;
    overflow: auto;
    resize: vertical;
    margin-left: 55px;
}
        /* Media query for larger screens (min-width: 768px) */
        @media (min-width: 768px) {
            textarea[name="sdescription"] {
                /* Set width to 557px for larger screens */
                width: 557px;
            }
        }
    
body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #333333;
    }

    form {
      max-width: 600px;
      margin: 0 auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 36px;
      margin-bottom: 50px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        font-size: 20px;
	margin-left: 54px;
    display: block;
    color: #333333;
    font-weight: bold;
    margin-bottom: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"] {
    width: 80%;
    padding: 10px;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-bottom: 20px;
    margin-left: 53px;

    }

    input[type="file"] {
      display: none;
    }

    .custom-file-upload {
      display: inline-block;
      padding: 10px 20px;
      cursor: pointer;
      background-color: #4CAF50;
      color: #ffffff;
      border-radius: 4px;
    }

    .custom-file-upload:hover {
      background-color: #45a049;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: #ffffff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }
    
    @media screen and (max-width: 600px) {
      form {
        padding: 10px;
      }
      
      label {
        font-size: 14px;
      }
      
      input[type="submit"] {
        width: 100%;
      }
    }
    
            input[type="file"] {
            display: none;
        }

        /* Style the custom file input button */
        label.upload-button {
            padding: 10px 15px;
            background-color: #3498db;
            color: black; /* Set the color to black */
            cursor: pointer;
            display: inline-block;
            border-radius: 5px;
        }

        /* Style the selected file name */
    span.file-name {
            margin-left: 10px;
            color: black; /* Set the color to black */
        }
        select {
            margin-bottom: 7px;
        height: 48px;
    width: 100%; 
    max-width: 557px;
    box-sizing: border-box; 
}


@media (min-width: 768px) {
    select {
        width: 557px; 
    }
      </style>
   </head>
   <body>
     <%
	    int id=Integer.parseInt(request.getParameter("id")); 
	  Connection con = DbConnection.connect(); 
	  PreparedStatement stmt = con.prepareStatement("select * from fruitsvegetables where fvid=?");
	  stmt.setInt(1, id);
	  ResultSet rs = stmt.executeQuery();
	  
	  %>
      <div class="wrapper">
         <!--Header Start-->
          <header class="header-style-2">
            <nav class="navbar navbar-expand-lg">
             <a class="navbar-brand" href="index.html" style="padding: 0px 0;"><img src="images/hmlogo.png" alt="" ></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <i class="fas fa-bars"></i> </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                  
                            <li class="nav-item" > <a class="nav-link" href="custDash.jsp">Home </a></li>
                  
                    
                        <li class="nav-item"> <a class="nav-link" href="myOrdersCustomer.jsp">My Order's</a> </li>
                   
                     
                      <li class="nav-item"> <a class="nav-link" href="about.html">About</a> </li>
                  
                           <li class="nav-item"> <a class="nav-link" href="contact.html">Contact</a> </li>
                     
                       <li class="nav-item"> <a class="nav-link" href="index.html">Logout</a> </li>
             
                  </ul>
                  
                  
         
               </div>
            </nav>
         </header>
          <section>
         <div class="container">
           <h1 style="font-family : Raleway,sans-serif; font-weight:900;font-size: 28px;padding-top: 16px;">Order </h1>
						  <form action="customerOrder" method="post" enctype="multipart/form-data">
           <%while(rs.next())
        { 
      int fvid=rs.getInt("fvid");
      int fvprice=rs.getInt("fvprice");
      int fid=rs.getInt("fid");
      String fvname=rs.getString("fvname");
      String fvcategory=rs.getString("fvcategory");
	   Blob productImageBlob = rs.getBlob("fvimage");
       byte[] productImageBytes = productImageBlob.getBytes(1, (int) productImageBlob.length());
       String base64Image = Base64.getEncoder().encodeToString(productImageBytes);
       PreparedStatement ps = con.prepareStatement("select * from customer where cid=?");
 	  ps.setInt(1, Data.getCid());
 	  ResultSet rs1 = ps.executeQuery();
 	
      %>

    
     
  								 <%while(rs1.next())
                                  { %>
							    <input type="hidden" name="cname" value="<%=rs1.getString("cname") %>">
							    <%} %>
						<center>
						
								 <img src="data:image/png;base64,<%= base64Image %>"  width="155"  height="120" alt="">
								 </center>
						<p> <label style="padding-top: 22px;" name="fvname" for="product_name">Product Name : <%=rs.getString("fvname") %> </label></p>
							  <input type="hidden" name="fvname" value="<%=fvname %>">
						  <input type="hidden" name="fvid" value="<%=fvid %>">
						  <input type="hidden" name="fid" value="<%=fid %>">
							<p>		<label for="product_name" name="fvprice" oninput="calculateTotal()" >Price : <%=rs.getInt("fvprice") %></label></p>
							    <input type="hidden" name="fvprice" value="<%=fvprice %>">
							     <input type="hidden" name="imageData" value="<%=  Base64.getEncoder().encodeToString(productImageBytes) %>">
							    <label for="product_quantity">Quantity</label>
							  <input type="number" id="quantity" name="quantity" min="1"  oninput="calculateTotal()" required><br>

							      <input type="hidden" name="fvcategory" value="<%=fvcategory %>">
							
							    <label for="product_description">Address  </label>
							    <textarea id="address" name="address" rows="2" placeholder="Enter address..." required></textarea>
							
							 <label for="product_quantity">Pincode</label>
							 <input type="text" id="pincode" name="pincode" pattern="[0-9]{1,6}"  inputmode="numeric" maxlength="6" required>
    
									 <div id="total"> </div>
					        <input type="submit" value="Place Order"  style="width: 160px;margin-left: 193px;">
					              <% } %>
						  </form>
						</div>
         </section>
         <!--Contact End--> 


 

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