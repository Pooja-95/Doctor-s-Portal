<%-- 
    Document   : updateadmin
    Created on : Mar 5, 2020, 3:58:18 PM
    Author     : Archal Gupta
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<!DOCTYPE html>

<html>
 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "connection.jsp" %>

<%
        String us,em,pass;
     
        us=request.getParameter("username");
       em=request.getParameter("email");
      
        pass=request.getParameter("password");

 try{

PreparedStatement pst=connection.prepareStatement("update admin set  username=? , email=? where email='"+em+"'and password='"+pass+"'");
    

    pst.setString(1,us);
    pst.setString(2,em);
  
    pst.executeUpdate();
   response.sendRedirect("adminprofile.jsp?email="+em+"&password="+pass);
    



connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>

    
</body>
</html>

