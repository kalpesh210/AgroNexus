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
    
        /* Apply styles to the product_description textarea */
        textarea[name="product_description"] {
            /* Default width for smaller screens */
            width: 100%;
            box-sizing: border-box;
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
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      color: #333333;
      font-weight: bold;
      margin-bottom: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #cccccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-bottom: 20px;
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
      </style>
   </head>
   <body>
   <% int sid=Integer.parseInt(request.getParameter("sid")) ;
	    
	  Connection con = DbConnection.connect();
	  PreparedStatement stmt = con.prepareStatement("select * from seeds");
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
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="index-2.html"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Home </a>
                        <ul class="dropdown-menu" >
                           <li><a href="index-2.html">Home One</a></li>
                           <li><a href="home-two.html">Home Two</a></li>
                           <li><a href="home-three.html">Home Three</a></li>
                        </ul>
                     </li>
                     <li class="nav-item"> <a class="nav-link" href="about.html">About</a> </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="events-grid.html"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Events </a>
                        <ul class="dropdown-menu" >
                           <li><a href="events-grid.html">Events Grid</a></li>
                           <li><a href="events-grid-2.html">Events Grid Two</a></li>
                           <li><a href="events-grid-3.html">Events Grid Three</a></li>
                           <li><a href="events-list.html">Events List</a></li>
                           <li><a href="events-list-two.html">Events List Two</a></li>
                           <li><a href="event-details.html">Event Details</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="causes.html"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Causes </a>
                        <ul class="dropdown-menu" >
                           <li><a href="causes.html">Causes Grid</a></li>
                           <li><a href="causes-list.html">Causes List</a></li>
                           <li><a href="causes-details.html">Causes Details</a> </li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="blog.html"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Blogs </a>
                        <ul class="dropdown-menu" >
                           <li><a href="blog.html">Blog Default</a></li>
                           <li><a href="blog-list.html">Blog List</a> </li>
                           <li><a href="blog-grid.html">Blog Grid</a></li>
                           <li><a href="blog-two-col.html">Blog Two Columns</a> </li>
                           <li><a href="blog-three-col.html">Blog Three Columns</a></li>
                           <li><a href="blog-details.html">Blog Details</a></li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Pages </a>
                        <ul class="dropdown-menu" >
                           <li>
                              <a href="#">Projects</a>
                              <ul class="dropdown-menu" >
                                 <li><a href="projects.html">Projects</a> </li>
                                 <li><a href="projects-grid.html">Projects Grid</a> </li>
                                 <li><a href="projects-grid-two.html">Projects Grid Two</a> </li>
                                 <li><a href="projects-list.html">Projects List</a> </li>
                                 <li><a href="projects-details.html">Project Details</a> </li>
                              </ul>
                           </li>
                           <li>
                              <a href="#">Shop</a>
                              <ul class="dropdown-menu" >
                                 <li><a href="shop.html">Shop</a> </li>
                                 <li><a href="shop-two.html">Shop Two</a> </li>
                                 <li><a href="shop-details.html">Shop Details</a> </li>
                              </ul>
                           </li>
                           <li>
                              <a href="team.html">Team</a>
                              <ul class="dropdown-menu" >
                                 <li><a href="team.html">Team One</a> </li>
                                 <li><a href="team-two.html">Team Two</a> </li>
                                 <li><a href="team-details.html">Team Details</a> </li>
                              </ul>
                           </li>
                           <li>
                              <a href="#">Gallery</a>
                              <ul class="dropdown-menu" >
                                 <li><a href="gallery-grid.html">Gallery Grid</a> </li>
                                 <li><a href="gallery-full.html">Gallery Full</a> </li>
                                 <li><a href="gallery-masonry.html">Gallery Masonry</a> </li>
                              </ul>
                           </li>
                           <li><a href="testimonials.html">Testimonials</a> </li>
                           <li><a href="donation.html">Donation</a> </li>
                           <li><a href="my-account.html">My Account</a> </li>
                           <li><a href="coming-soon.html">Coming Soon</a> </li>
                           <li><a href="page-404.html">404 Error</a> </li>
                        </ul>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="contact.html"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Contact </a>
                        <ul class="dropdown-menu" >
                           <li><a href="contact-one.html">Contact One</a> </li>
                           <li><a href="contact-two.html">Contact Two</a> </li>
                        </ul>
                     </li>
                  </ul>
       
               </div>
            </nav>
         </header>
         
      
         <!--Contact Start-->
         <section>
         <div class="container">
						  <h1 style="font-family : Raleway,sans-serif; font-weight:900;font-size: 28px;padding-top: 16px;">Add Seed Product </h1>
						  <form action="seedsUpdate" method="post" enctype="multipart/form-data">
											
					        <!-- Custom file input -->
					        <label for="product_price">Update Price :</label>
					        <input type="number" name="sprice" ><br>
					        <label for="product_stock">Update Stock :</label>
					        <input type="number" name="sstock" ><br>
					        <label for="product_description">Update Description :</label>
					         <textarea name="sdescription" ></textarea><br>
					         <input type="hidden" name="sid"  value="<%=sid %>" id="sid" >
					        <input type="submit" value="Update Information">
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
                           <h4>About Ecova</h4>
                           <p> If anything’s hot in today’s economy, it’s saving money, including a broad range of green businesses helping people save energy, water, and other resources. Definitely, you can go with this business as it is a nothing but the future. </p>
                           <a href="#" class="lm">About us</a> 
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>Our Promises</h4>
                           <ul class="quick-links">
                              <li><a href="#">Solar Energy</a></li>
                              <li><a href="#">Waste Management</a></li>
                              <li><a href="#">Eco Ideas</a></li>
                              <li><a href="#">Recycling Materials</a></li>
                              <li><a href="#">Plant Ecology</a></li>
                              <li><a href="#">Saving Wildlife </a></li>
                           </ul>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <h4>Latest Posts</h4>
                           <ul class="lastest-products">
                              <li> <img src="images/flp1.jpg" alt=""> <strong><a href="#">How you can keep alive wild animals for...</a></strong> <span class="pdate"><i>Posted:</i> 29 September, 2018</span> </li>
                              <li> <img src="images/flp2.jpg" alt=""> <strong><a href="#">Eliminate your plastic bottle pollution & keep...</a></strong> <span class="pdate"><i>Posted:</i> 29 September, 2018</span> </li>
                              <li> <img src="images/flp3.jpg" alt=""> <strong><a href="#">How you can keep alive wild animals for...</a></strong> <span class="pdate"><i>Posted:</i> 29 September, 2018</span> </li>
                           </ul>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                     <div class="col-lg-3 col-md-6 col-sm-6">
                        <!--Footer Widget Start-->
                        <div class="footer-widget">
                           <div id="fpro-slider" class="owl-carousel owl-theme">
                              <!--Footer Product Start-->
                              <div class="item">
                                 <div class="f-product">
                                    <img src="images/fpro1.jpg" alt="">
                                    <div class="fp-text">
                                       <h6><a href="#">Buy T-Shirts</a></h6>
                                       <strong>$19.00</strong> 
                                    </div>
                                 </div>
                              </div>
                              <!--Footer Product End--> 
                              <!--Footer Product Start-->
                              <div class="item">
                                 <div class="f-product">
                                    <img src="images/fpro1.jpg" alt="">
                                    <div class="fp-text">
                                       <h6><a href="#">Buy T-Shirts</a></h6>
                                       <strong>$19.00</strong> 
                                    </div>
                                 </div>
                              </div>
                              <!--Footer Product End--> 
                              <!--Footer Product Start-->
                              <div class="item">
                                 <div class="f-product">
                                    <img src="images/fpro1.jpg" alt="">
                                    <div class="fp-text">
                                       <h6><a href="#">Buy T-Shirts</a></h6>
                                       <strong>$19.00</strong> 
                                    </div>
                                 </div>
                              </div>
                              <!--Footer Product End--> 
                           </div>
                        </div>
                        <!--Footer Widget End--> 
                     </div>
                  </div>
               </div>
            </div>
            <div class="footer-copyr wf100">
               <div class="container">
                  <div class="row">
                     <div class="col-md-4 col-sm-4"> <img src="images/logo.png" alt=""> </div>
                     <div class="col-md-8 col-sm-8">
                        <p><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></p>
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