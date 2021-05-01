<%-- 
    Document   : updatepassworddoctor
    Created on : Mar 12, 2020, 10:23:26 PM
    Author     : Archal Gupta
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "connection.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	
<%
        String password;
      String  email=request.getParameter("email");
        password=request.getParameter("password");

 try{

PreparedStatement pst=connection.prepareStatement("update doctorregister set password=? where email='"+email+"'");
    

    pst.setString(1,password);
    
  
    pst.executeUpdate();
   response.sendRedirect("index.html?password="+password);
    



connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
    </body>
</html>
