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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <meta charset="utf-8">
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
      .card {
          margin-top: 34px;
      padding-top: 20px;
  transition: transform 0.5s ease;
}

.card:hover {
  transform: scale(1.1);
}
      
     </style>

</head>
<body>
<%@ page import ="java.sql.*"  %>
 <%@ page import="com.farm.*"%>

     <%
	    
	  Connection con = DbConnection.connect();
	  PreparedStatement stmt = con.prepareStatement("select * from seeds where aid=?");
	  int aid= Data.getAid();
	  stmt.setInt(1,aid);
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
         
         <div id="search">
            <button type="button" class="close">×</button>
            <form class="search-overlay-form">
               <input type="search" value="" placeholder="type keyword(s) here" />
               <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
            </form>
         </div>
         <!--Header End--> 
         
           <!--Slider Start-->
         <section id="home-slider" class="owl-carousel owl-theme wf100">
            <div class="item">
                <img src="images/fertilizer.jpg" alt="" style="height: 513px;"> 
               <div class="slider-caption h2slider">
                  <div class="container">
                     
                    <a  style="margin: 310px 16px 0 0;"  href="agroDash1.jsp" class="active">Seeds Products</a> <a href="agroDash2.jsp">Fertilizers Products</a> 
                     
             </div>
               </div>
       
            </div>
            <div class="item">
                <img src="images/seeds1.jpg" alt="" style="height: 513px;">  
               <div class="slider-caption h2slider">
                  <div class="container">
                 
                    <a style="margin: 310px 16px 0 0;" href="agroDash1.jsp" class="active">Seeds Products</a> <a href="agroDash2.jsp">Fertilizers Products</a> 
                     
                   </div>
               </div>
       
            </div>
           
         </section>
         <!--Slider End--> 
       
        <section class="testimonials-section wf100 p80" style="padding: 13px;">
            <h1 class="text-center" style="font-family : Raleway,sans-serif; font-weight:900;font-size: 28px;padding-top: 16px;">ALL MY PRODUCTS</h1>

            </section>
           
       

	       <!--Causes Start-->
         <section class="wf100 p80 blog">
            <div class="projects-grid">
               <div class="container">
                  <div class="row" style="margin-right: 48px;margin-left: 48px;    margin-top: -53px;">
                 
                        <%while(rs.next())
	            { 
              
                    Blob productImageBlob = rs.getBlob("simage");
                    byte[] productImageBytes = productImageBlob.getBytes(1, (int) productImageBlob.length());
                    String base64Image = Base64.getEncoder().encodeToString(productImageBytes);
	            %>
	                <div class="col-md-4 col-sm-6 card" >
                        <!--campaign box start-->
                        <div class="ser-box">
                           <div class="ser-thumb">
                              <img src="data:image/png;base64,<%= base64Image %>"  width="252"  height="200" alt="">
                           </div>
                             <div class="pro-txt" style="padding: 9px 6px;padding-bottom: 14px;">
                           <h6><a href="#" style="font-size: 22px;color: #000000;"> <%=rs.getString("sname") %></a></h6>
                             <h6><a href="#" style=";font-size: 15px;color: #000000;">Category :<%=rs.getString("scategory") %></a></h6>
                           <h6 style="font-size: 12px;"><%= rs.getString("sdescription") %></h6>
                           <p class="pro-price" style="color: black;font-size: 22px;">&#x20b9  <%=rs.getInt("sprice") %><span style="color: black;font-size: 12px;">/Kg</span><a style="font-size: 11px;margin-left: 16px;">Stock : <%=rs.getString("sstock") %></a><button style="background-color: #4ed9ff;color: black;width: 51px;margin-left: 14px;"><a href="updateSeeds.jsp?id=<%= rs.getInt(1) %>" style="color: black;font-size:11px">Update</a></button> </p>
                              <button style="background-color: green;color: white;width: 201px;"><a href="deleteSeeds.jsp?id=<%= rs.getInt(1) %>" style="color: #ffffff;">Delete</a></button> 
                        </div>
                         
                        </div>
                        <!--campaign box end--> 
                     </div>
                       <% }  %>
                  
                      </div>
               </div>
            </div>
         </section>
         <!--Causes End--> 
         


           
           
                <!--Testimonials Start-->
            <section class="testimonials-section bg-white wf100 p80" style="padding: 22px 0;">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="section-title-2 text-center">
                           <h5>Testimonials</h5>
                           <h2>What Farmer's Says</h2>
                        </div>
                        <div id="testimonials" class="owl-carousel owl-theme">
                           <!--testimonials box start-->
                           <div class="item">
                              <p>"AgroNexus provides a user-friendly interface that makes it easy for me to connect with buyers and sell my produce efficiently. I highly recommend AgroNexus to fellow farmers."</p>
                              <div class="tuser"> <img src="images/tuser1.jpg" alt=""> <strong>Ravindra Dhangar</strong>Farmer</div>
                           </div>
                           <!--testimonials box End--> 
                           <!--testimonials box start-->
                           <div class="item">
                              <p>"I have access to a wide network of suppliers for purchasing agricultural inputs, but I also benefit from the wealth of knowledge and resources available on the platform. AgroNexus has truly elevated my farming practices."</p>
                              <div class="tuser"> <img src="images/tuser2.jpg" alt=""> <strong>Nilesh Patil</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                    
                           <!--testimonials box start-->  
                           <div class="item">
                              <p>"AgroNexus goes beyond just being a marketplace. It's a hub of information and support for farmers. The educational resources and expert advice available on the platform have helped me implement sustainable farming."</p>
                              <div class="tuser"> <img src="images/tuser1.jpg" alt=""> <strong>Manoj Sharma</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                           <!--testimonials box start-->
                           <div class="item">
                              <p>"AgroNexus has revolutionized the way I manage my farm. The integration of advanced technologies has allowed me to optimize my productivity and make informed decisions. "</p>
                              <div class="tuser"> <img src="images/tuser1.jpg" alt=""> <strong>Vinod Kumar</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                           
                           
                           
                           <!--testimonials box start-->
                           <div class="item">
                              <p>As opposed to using 'Content here, content here', making it look like readable English. Many Desktop and Web Pages are using lorem ipsum.</p>
                              <div class="tuser"> <img src="images/tuser2.jpg" alt=""> <strong>Deepak Pande</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                           <!--testimonials box start-->
                           <div class="item">
                              <p>It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
                              <div class="tuser"> <img src="images/tuser3.jpg" alt=""> <strong>Vikram Rajput</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                           
                         
                           
                           
                           <!--testimonials box start-->
                           <div class="item">
                              <p>"AgroNexus has been a reliable and secure platform for buying and selling agricultural products. AgroNexus is a trustworthy partner in my agricultural journey." </p>
                              <div class="tuser"> <img src="images/tuser1.jpg" alt=""> <strong>Suresh Koli</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                   
                           <!--testimonials box start-->
                           <div class="item">
                              <p>"AgroNexus has exceeded my expectations with its emphasis on sustainable farming practices. The platform actively promotes eco-friendly techniques and responsible resource management. "</p>
                              <div class="tuser"> <img src="images/tuser2.jpg" alt=""> <strong>Sanjay Yadav</strong> Farmer </div>
                           </div>
                           <!--testimonials box End--> 
                           
                   
                        
                        </div>
                     </div>
                  </div>
               </div>
            </section>
            <!--Testimonials End--> 
           
            
            
            
      <!--Contact Start-->
         <section class="contact-page wf100 p80">
         
            <div class="container">
               <div class="row" style="margin-right: 61px;margin-left: -165px;">
                  <div class="col-md-1" style="padding-right: 102px;padding-left: 0px;"></div>
                  <div class="col-md-10">
                            <div class="wf100 comment-form">
                                    <h4>Leave a Comment</h4>
                                 
                                    <ul>
                                       <li class="w3">
                                          <input type="text" class="form-control" placeholder="Full Name">
                                       </li>
                                       <li class="w3">
                                          <input type="text" class="form-control" placeholder="Email">
                                       </li>
                                       <li class="w3 np">
                                          <input type="text" class="form-control" placeholder="Subject">
                                       </li>
                                       <li class="full">
                                          <textarea class="form-control" placeholder="Write Comments"></textarea>
                                       </li>
                                       <li class="full">
                                          <button class="post-btn">Post Your Comment</button>
                                       </li>
                                    </ul>
                                 </div>
                             </div>
                         </div>
                  </div>
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