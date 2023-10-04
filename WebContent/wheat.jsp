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

<html lang="en">
   
<head>
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
      html body {
    margin: 0px;
    padding: 0px;
    font-weight: 400;
    font-family: 'Roboto', sans-serif;
    color: white;
}
      </style>
   </head>
   <body>
   
   
      <div class="wrapper home2">
         <!--Header Start-->
         <header class="header-style-2">
            <nav class="navbar navbar-expand-lg" >
               <a class="navbar-brand" href="index.html" style="padding: 0px 0;"><img src="images/hmlogo.png" alt="" ></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <i class="fas fa-bars"></i> </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="index.html"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Home </a>
                        
                     </li>
                      <li class="nav-item"> <a class="nav-link" href="fLogin.html">Farmer</a> </li>
                     
                      <li class="nav-item"> <a class="nav-link" href="cLogin.html">Customer</a> </li>
                     </li>
                        
                      <li class="nav-item"> <a class="nav-link" href="aLogin.html">Agro Agency</a> </li>
                     </li>
                     
                      <li class="nav-item"> <a class="nav-link" href="about.html">About</a> </li>
                     </li>
                       
                           
                           
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="contact.html"  role="button" aria-haspopup="true" aria-expanded="false"> Contact </a>
                       
                     </li>
                  </ul>
                  
               </div>
            </nav>
         </header>
         
            <%
         String crname="Wheat";
          Connection con = DbConnection.connect(); 
      	  PreparedStatement stmt = con.prepareStatement("select * from crops where crname=?");
      	
      	  stmt.setString(1,crname);
      	  ResultSet rs = stmt.executeQuery();
      	

	  %>
   
<!--News & Articles Start-->
         <section class="h2-news wf100 p80">
            <div class="container">
               <div class="row">
                  <%while(rs.next())
	            { 
              
                    Blob productImageBlob = rs.getBlob("crimage");
                    byte[] productImageBytes = productImageBlob.getBytes(1, (int) productImageBlob.length());
                    String base64Image = Base64.getEncoder().encodeToString(productImageBytes);
	            %>
                  <div class="col-md-12">
                     <div class="section-title-2" style="color: #170000;">
                         <img  style=" display: block;margin-left: auto;margin-right: auto;width: 25%;" src="data:image/png;base64,<%= base64Image %>"  alt="">
                        <h5><%= crname %></h5>
                
<div class="space-clear" style="margin-top:10px;">
<h2><a name="intro"></a><b style="font-size: 27px;">Introduction:</b></h2>
<p style="color: #170000;font-weight: 400;">Wheat (<i>Triticum spp</i>.) occupies the prime position among the food crops in the world. In
    India, it is the second important food crop being next to rice and contributes to the
    total foodgrain production of the country to the extent of about 25%. Wheat has played a
    very vital role in stabilizing the foodgrain production in the country over the past few
    years.<br /><br />The origin of the durum wheats was probably in the region of Abyssinia,
    whereas the whole group of soft wheat, which includes the bread wheats, probably
    originated in the region of Pakistan, SouthWestern and the Southern parts of mountainous
    Bokhara.<br /><br />
	<b>Classification of Indian Wheats:</b><br />
    <strong>1. Emmer Wheat (Triticum dicoccum schub L.) :</strong><br /> This type was reported to be grown in south i.e. Maharashtra, Tamil Nadu and Karnataka. This type is believed to be developed from T. diccoides koru., a wild form. It is also grown in Spain, Italy, Germany and Russia.<br /><br />
    <strong>2. Macroni Wheat ( T.durum Desf.) :</strong> The durum or macroni wheat, cultivation in India, is considered to be very old. It is a best wheat for drought conditions or under restricted irrigated conditions of Punjab, M.P., Karnataka, Tamil Nadu, Gujarat, West Bengal and H.P. It is used for semolina (suji) preparation.<br /><br />
   <strong> 3. Common Bread Wheat ( T. vulgare Host) :</strong><br>
        It is a typical wheat of alluvial soils of Indo-Gangetic plains i.e.Punjab, Uttar Pradesh,
        Bihar and parts of Rajasthan. The bulk of the Indian crop, therefore, consists of this type.<br /><br />
        <strong>4. Indian Dwarf Wheat (T.spherococcum Mihi.) :</strong><br>
        This belongs to the club wheat of western countries. This is found in limited areas of
        M.P., U.P., of India and in Pakistan. These are characterised by very short and compact
        heads having a shorter grains.<br /><br />
        <strong>5. Triticum aestivum :</strong><br />
        This is the type presently grown in India in almost all the wheat growing zones. It is used mainly for bread purpose.</p>
</div>
<div class="space-clear" style="margin-top:10px;">
<h2 style="font-size: 27px;"><a name="cli"></a>Climate and Soil:</h2>
<p style="color: #170000;">The ideal temperature requirement varies from plant type and stages of growth. The dwarf
    varieties require the following temperature for their growth and development:<br /></p>
    <table class="table table-bordered" style="width:75% font-size:14px;color: #170000;">
    <tr><th>Growth stages</th><th>Temperature requirement</th></tr>
    <tr><td>Germination</td><td>20 to 25 0 C mean daily temperature</td></tr>
    <tr><td>Tillering</td><td>16 to 20 0 C mean daily temperature</td></tr>
    <tr><td>Accelerated growth</td><td>20 to 23 0 C mean daily temperature</td></tr>
    <tr><td>Proper grain filling</td><td>23 to 25 0 C mean daily temperature.</td></tr>
    </table>
    <p>Wheat plants are sensitive to very cold or frost injury at any stage of growth particularly at reproductive growth if temperature is below 150</p>
</div>
<div class="space-clear" style="margin-top:10px;">
<h2 style="font-size: 27px;"><a name="land"></a>Land Preparation:</h2>
<p style="color: #170000;">The wheat crop requires a well-pulverized but compact seed bed for good and uniform
    germination. Three or four ploughings in the summer, repeated harrowing in the rainy
    season, followed by three or four cultivations and planking immediately before sowing
    produce a good, firm seed bed for the dry crop on alluvial soils. For the irrigated crop,
    the land is given a pre-sowing irrigation (palewa or raund) and the number of ploughings
    is reduced. Where white ants or other pests are a problem, Aldrin 5% or BHC 10% dust at
    the rate of 25 kg/ha should be applied to the soil after the last ploughing or before
    planking.<br /></p>
</div>
<div class="space-clear" style="margin-top:10px;color: #170000;">
<h2 style="font-size: 27px;"><a name="variety"></a>Varieties</h2>
<table class="table table-bordered" style="font-size:14px;color: #170000;" width="100%">
<tr><th colspan="5">Irrigated and rainfed wheat varieties recommended for Maharashtra</th></tr>
<tr><th>Sr.No</th><th>Variety</th><th>Time to flower</th><th>Maturity time</th><th>	Yield q./ha</th></tr>
<tr><th colspan="5">Irrigated timely sown wheat varieties</th></tr>
<tr><td>1</td><td>HD 2189</td><td>60-65</td><td>110-115</td><td>30-35</td></tr>
<tr><td>2</td><td>Malvika</td><td>65-70</td><td>120-125</td><td>25-30</td></tr>
<tr><td>3</td><td>HD-2380</td><td>55-60</td><td>105-110</td><td>30-35</td></tr>
<tr><td>4</td><td>MACS 2496</td><td>60-65</td><td>110-115</td><td>30-35</td></tr>
<tr><td>5</td><td>5	Purna</td><td>65-70</td><td>110-115</td><td>30-35</td></tr>
<tr><td>6</td><td>HD-2278</td><td></td><td></td><td></td></tr>
<tr><td>7</td><td>NI-5439</td><td></td><td></td><td></td></tr>
<tr><td>8</td><td>PBN-142</td><td></td><td></td><td></td></tr>
<tr><th colspan="5">Irrigated Late sown wheat varieties</th></tr>
<tr><td>1</td><td>Sonalika</td><td>55-60</td><td>95-100</td><td>25-30</td></tr>
<tr><td>2</td><td>AKW-381</td><td>50-55</td><td>90-95</td><td>25-30</td></tr>
<tr><td>3</td><td>HI-977</td><td>55-60</td><td>100-105</td><td>25-30</td></tr>
<tr><td>4</td><td>HD-2501</td><td>55-60</td><td>100-105</td><td>25-30</td></tr>
<tr><td>5</td><td>Purna</td><td>55-60</td><td>100-105</td><td>25-30</td></tr>
<tr><td>6</td><td>HD 2610</td><td></td><td></td><td></td></tr>
<tr><td>7</td><td>NI-9947</td><td></td><td></td><td></td></tr>
<tr><td>8</td><td>NIAW 34</td><td></td><td></td><td></td></tr>
<tr><th colspan="5">Rainfed wheat varieties</th></tr>
<tr><td>1</td><td>NI-59</td><td>55-60</td><td>115-120</td><td>8-10</td></tr>
<tr><td>2</td><td>MACS 9</td><td>55-60</td><td>110-115</td><td>8-10</td></tr>
<tr><td>3</td><td>MACS 1967</td><td>55-60</td><td>105-110</td><td>8-10</td></tr>
<tr><td>4</td><td>N 5439</td><td></td><td></td><td></td></tr>
<tr><td>5</td><td>N-8223</td><td></td><td></td><td></td></tr>
<tr><td>6</td><td>NIDW-15</td><td></td><td></td><td></td></tr>
</table>
</div>
<div class="space-clear" style="margin-top:10px;">
<h2 style="font-size: 27px;"><a name="sow"></a>Sowing:</h2>
<p style="color: #170000;font-weight: 400;"><b>a) Sowing time:</b><br /> Based on above temperature requirement it has been found that for
    indigenous wheat last week of October, for long duration dwarf varieties like Kalyansona,
    Arjun, etc. first fortnight of November and for short duration dwarf wheats like Sonalika,
    Raj 821 etc. second fortnight is the best sowing time. Under exceptionally late sown
    condition it may be delayed to latest by 1<sup>st</sup> week of December beyond which if
    area is very small transplanting may be practiced.<br /><br />
    <b>b) Seed rate:</b><br />
    Generally, a seed rate of 100 kg/ha has been found to be sufficient
    for most of the varieties like Kalyan Sona, Arjun, Janak, etc.which have moderate
    tillering and medium sized grains. But a higher seed rate of 125 kg/ha is desirable for
    late sown wheat and normal sown for varieties like Sonalika, Raj 821 etc. which have bold
    grains and shy tillering habits.<br /><br />
    <b>c) Spacing: : </b><br />For irrigated, timely sown wheat, a row spacing of 15 to 22.5 cm is
    followed, but 22.5 cm between the rows is considered to be the optimum spacing. Under
    irrigated late-sown conditions, a row spacing of 15-18 cm is the optimum. For dwarf
    wheats, the planting depth should be between 5 and 6 cm. Planting beyond this depth
    results in a poor stand. In the case of conventional tall varieties, the depth of sowing
    may be 8 or 9 cm.<br /><br />
    <b>d) Seed treatment:</b><br />The seed of loose smut-susceptible varieties should be given solar
    or hot-water treatment. If the wheat seed is used only for sowing, and not for human
    consumption or for feeding cattle, it can be treated with Vitavax.<br /></p>
</div>

    </ol><br /><br />Total quantity of Phosphorus and potash and half the quantity of
    nitrogen should be applied at the time of sowing. Remaining quantity of Nitrogen should be
    applied at the time of crown root initiation.For the late sown irrigated wheat crop, the
    NPK fertilizer dose recommended is: <br />N &#150; 60-80 kg/ha<br>
    P2O5 &#150; 30-40 kg/ha<br>
    K2O &#150; 20-25 kg/ha.<br /></p>
</div>

                      </p>
                           
                        </div>
       
                  </div>
                  <%} %>
               </div>
            </div>
         </section>
         <!--News & Articles End--> 
     
         
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
                              <li><a href="knowledgeHub.jsp">Knowledge Hub</a></li>
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