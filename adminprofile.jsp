<%-- 
    Document   : adminprofile
    Created on : Mar 3, 2020, 1:25:45 PM
    Author     : Archal Gupta
--%>
<%@page import="org.apache.coyote.http11.Constants"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page session="true" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<!DOCTYPE html>

<html>
    <head>
        <title>SING UP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">
    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
                                 
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Mediplus</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="#home-section" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="#about-section" class="nav-link"><span>About</span></a></li>
	          <li class="nav-item"><a href="#department-section" class="nav-link"><span>Department</span></a></li>
	          <li class="nav-item"><a href="#doctor-section" class="nav-link"><span>Doctors</span></a></li>
	          <li class="nav-item"><a href="#blog-section" class="nav-link"><span>Blog</span></a></li>
	          <li class="nav-item"><a href="#contact-section" class="nav-link"><span>Contact</span></a></li>
	          <li class="nav-item cta mr-md-2"><a href="appointment.jsp" class="nav-link">Appointment</a></li>
                  <li class="nav-item cta mr-md-2"> <a href="logout.jsp" class="nav-link">Logout</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
        
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("em") == null)
{
response.sendRedirect("login.html");
}

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "doctor";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>



<%
try{
String em = request.getParameter("email");
String pass = request.getParameter("password");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from admin where email='"+em+"'and password='"+pass+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<br>
<br>
   
  

<table>
    
    <div>
        <style>
div {
  
  padding-left: 10px;
}
</style>
       <div class="row">
        
		<div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="staff">
			<div class="img-wrap d-flex align-items-stretch">
				<div class="img align-self-stretch" style="background-image:  url(images/bg_1.jpg);"></div>
	</div>
		<div class="text pt-3 text-center">
                        <h3 class="mb-2"><%=resultSet.getString("username")%> 
                            <%=resultSet.getString("email") %></h3>
                             <div class="faded">
           
	<ul class="ftco-social text-center">
            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
		        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
	 </ul>

                </div>
        </div>
                         

  <button id="show2" class="btn btn-primary">Update</button>
<style>
dialog{width:400px;}
</style>
<dialog id="dialog2">
  <form action="updateadmin.jsp" method="post" class="appointment-form ftco-animate" >
    <div class="container">
        <div class="">
            
            
<div class="form-group">
        <h6> User Name</h6>
        <input type="text" class="form-control" name="username" value="<%=resultSet.getString("username")%>" required autocomplete="off"><br>
</div>
<div class="form-group">
        <h6> Email </h6>
        <input type="email" class="form-control" name="email" value="<%=resultSet.getString("email")%>" required autocomplete="off"><br>
</div>

                     <input type="hidden" name="email" value="<%=em%>">
                     <input type="hidden" name="password" value="<%=pass%>">
                     </div>
                 <input type="submit" class="btn btn-secondary py-3 px-4">
                  
                  </div>
         
               
    </input>
    </form>
     <button id="hide2"  class="btn btn-secondary py-3 px-4">Close </button>
</dialog>
                          
                       
             <button id="show3" class="btn btn-primary">Change Password</button>             


  <div class="col-md-5 d-flex">
	        	<div class="appointment-wrap bg-white p-5 d-flex align-items-center">
                            
<style>
dialog{width:500px;}
</style>
<div class="">
<dialog id="dialog3">
  <form action="adminchangepassword.jsp" method="post" class="appointment-form ftco-animate" >
    <div class="container">
<div class="form-group">
        <h4> Current  password</h4>
        <input type="password" class="form-control" name="current"  placeholder="Current Password" required autocomplete="off"><br>
</div>
        <div class="form-group"
        <h4> New  Password</h4>
        <input type="password" class="form-control" name="new"  placeholder="New Password" required autocomplete="off"><br>
                     <input type="hidden" name="email" value="<%=em%>">
        </div>
                     <div class="form-group"
                     <h4> Confirm  password</h4>
                   <input type="password" class="form-control" name="confirm"  placeholder="Confirm Password" required autocomplete="off"><br>
                   
                   <input type="submit" class="btn btn-secondary py-3 px-4">
                  </div>
       
         
    </input>
    <button id="hide3"  class="btn btn-secondary py-3 px-4">Close </button>
</form></div></div>
        
</dialog>
<!-- "Show" button -->



<!-- JavaScript to provide the "Show/Close" functionality -->
<script type="text/JavaScript">
(function() {  
    var dialog3 = document.getElementById('dialog3');  
    document.getElementById('show3').onclick = function() {  
        dialog3.showModal();  
    };  
    document.getElementById('hide3').onclick = function() {  
        dialog3.close();  
    };  
})();
(function() {  
    var dialog2 = document.getElementById('dialog2');  
    document.getElementById('show2').onclick = function() {  
        dialog2.showModal();  
    };  
    document.getElementById('hide2').onclick = function() {  
        dialog2.close();  
    };  
})();
</script>
  
                                </div>
                            </div>
                        </div>
                     </div>
       
 <form action="mail.jsp">
                            <table style="width:100%" border="1">
                                <thead>
                            <th> First Name </th>
                             <th> Last Name </th>
                              <th> Email </th>
                              <th> phone </th>
                               <th> npino </th>
                               <th> country</th>
                               <th> address</th>
                               <th> qualification </th>
                               <th> experience</th>
                                <th> specialization </th>
                                <th> insurance </th>
                                <th> doctorbio </th>
                                <th> image</th>
                                <th>link</th>
                       
                            </thead>
        
                            <tbody>
                     <% PreparedStatement st = connection.prepareStatement("select * from doctorregister where active=0");
                     ResultSet rs = st.executeQuery();
                     while(rs.next())
                     {
                     %>
                     <tr>         
                               
                                <td><%= rs.getString(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(4) %></td>
                                <td><%= rs.getString(5) %></td>
                                <td><%= rs.getString(6) %></td>
                                <td><%= rs.getString(7) %></td>
                                <td><%= rs.getString(8) %></td>
                                <td><%= rs.getString(9) %></td>
                                <td><%= rs.getString(10) %></td>
                                <td><%= rs.getString(11) %></td>
                                <td><%= rs.getString(12) %></td>
                                <td><%= rs.getString(14) %></td>
                               
                         <td><a href="mail.jsp?email=<%= rs.getString(3) %>"class="btn btn-primary">verify doctor</a> </td>

                      <% } %>
                   
                   
                      </form>
                   </tbody></table>
                  
                        <%
                                 
                 if(em !=null && em.length() !=0)
                     session.setAttribute("email",em);
                 else 
                     response.sendRedirect("login.html");
                     
                        
                        %>
                  
                         <%
                        if(session.getAttribute("email") !=null)
                 {
                    String sessionName = (String)session.getAttribute("email");
                   
                    %>
                     

                  <%          
                  }
                     
                   else 
                         response.sendRedirect("index.html");
                         %>   

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

 </section>

 <br>
 <br>
 <br>
        
   
         <footer class="ftco-footer ftco-section img" style="background-image: url(images/footer-bg.jpg);">
    	<div class="overlay"></div>
      <div class="container-fluid px-md-5">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Mediplus</h2>
              <p>Far far away, behind the word mountains, far from the countries.</p>
              <ul class="ftco-footer-social list-unstyled mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Departments</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Neurology</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Opthalmology</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Nuclear Magnetic</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Surgical</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Cardiology</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Dental</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Links</h2>
              <ul class="list-unstyled">
                <li><a href="#home-section"><span class="icon-long-arrow-right mr-2"></span>Home</a></li>
                <li><a href="#about-section"><span class="icon-long-arrow-right mr-2"></span>About</a></li>
                <li><a href="#department-section"><span class="icon-long-arrow-right mr-2"></span>Departments</a></li>
                <li><a href="#doctor-section"><span class="icon-long-arrow-right mr-2"></span>Doctors</a></li>
                <li><a href="#blog-section"><span class="icon-long-arrow-right mr-2"></span>Blog</a></li>
                <li><a href="#pricing-section"><span class="icon-long-arrow-right mr-2"></span>Pricing</a></li>
                <li><a href="#contact-section"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Services</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Emergency Services</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Qualified Doctors</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Outdoors Checkup</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>24 Hours Services</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
	
           <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
        
        
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  
  <script src="js/main.js"></script>
  
  
  
    
</body>
</html>
