<!doctype html>
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
        body {
            font-family: Arial, sans-serif;
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
      </style>
      
       <script>
       function displayLiveDateTime() {
           var now = new Date();
           var options = { 
               weekday: 'long', 
               year: 'numeric', 
               month: 'long', 
               day: 'numeric', 
               hour: '2-digit', 
               minute: '2-digit', 
               second: '2-digit' 
           };
           var formattedDateTime = now.toLocaleString(undefined, options);
           document.getElementById("liveDateTime").textContent = formattedDateTime;
           setTimeout(displayLiveDateTime, 1000); // Update the date and time every second (1000 milliseconds)
       }

       window.onload = displayLiveDateTime; // Start the function when the page is loaded
   </script>

   </head>
   <body>
   <%@ page import ="java.sql.*"  %>
 <%@ page import="com.farm.*"%>

     <%
     int id = Integer.parseInt(request.getParameter("id"));
	  Connection con = DbConnection.connect();
	  PreparedStatement stmt = con.prepareStatement("select * from farmerorder where oid=?");
	  stmt.setInt(1,id);
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
                
                     
                      <li class="nav-item" > <a class="nav-link" href="farmDash1.jsp">Home </a></li>
                   
                    <li class="nav-item"> <a class="nav-link" href="addFV.html">Add Products</a> </li>
                                      
                         <li class="nav-item"> <a class="nav-link" href="myOrdersFarm.html">My Order's</a> </li>
                     
                      <li class="nav-item"> <a class="nav-link" href="viewFarmerOrder.jsp">View Order's</a> </li>
                                
                      <li class="nav-item"> <a class="nav-link" href="about.html">About</a> </li>
                  
                           <li class="nav-item"> <a class="nav-link" href="contact.html">Contact</a> </li>
                     
                       <li class="nav-item"> <a class="nav-link" href="index.html">Logout</a> </li>
             </ul>
               </div>
            </nav>
         </header>
         
   
     
        <div class="success-message">
        <div class="checkmark"></div>
        <div class="message">Order Successfully Placed</div>
    </div>
      <%while(rs.next())
	            { 
    	  PreparedStatement ps = con.prepareStatement("select * from farmer where fid=?");
    		 int fid=rs.getInt("fid");
    		  ps.setInt(1,fid);
    		  ResultSet rs1 = ps.executeQuery();
 
    		  java.util.Date currentDate = new java.util.Date();
    	        java.text.SimpleDateFormat sdfDate = new java.text.SimpleDateFormat("EEEE, MMMM dd, yyyy");
    	        String formattedDate = sdfDate.format(currentDate);
    	        java.text.SimpleDateFormat sdfTime = new java.text.SimpleDateFormat("hh:mm:ss a");
    	        String formattedTime = sdfTime.format(currentDate);
	            %>
    <div class="order-details" style="color: #000000;">
        <h2>Order Details</h2>
        <p><strong>Order ID:</strong> <%=rs.getInt("oid") %></p>
        <p><strong>Date  :</strong><%= formattedDate %></p>
     <p><strong>Time  :</strong><%= formattedTime %></p>

    
        <% while(rs1.next())
	            { %>
        <p><strong>Farmer Name:</strong>   <%=rs1.getString("fname") %></p>
        <%} %>
        <p><strong>Shipping Address:</strong> <%=rs.getString("address") %></p>
        <p><strong>Item:</strong></p>
        <ul>
            <li>Product Name - <%=rs.getString("pname") %></li>
             <li>Product Type - <%=rs.getString("ptype") %></li>
            <li>Price -  <%=rs.getInt("pprice") %></li>
            <li>Quantity -  <%=rs.getInt("quantity") %></li>
            <!-- Add more product items here -->
        </ul>
        <p><strong>Total:</strong> <%=rs.getInt("pprice")*rs.getInt("quantity")%></p>
        <%} %>
        
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