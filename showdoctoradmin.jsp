<%-- 
    Document   : showdoctoradmin
    Created on : Mar 5, 2020, 12:27:05 PM
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
        String fn,ln,em,ph,npi,co,add,qu,ex,sp,in,doc,fi,im;
        fn=request.getParameter("fname");
        ln=request.getParameter("lname");
        em=request.getParameter("email");
        ph=request.getParameter("phone");
        npi=request.getParameter("npino");
        co=request.getParameter("country");
        add=request.getParameter("address");
        qu=request.getParameter("qualification");
        ex=request.getParameter("experience");
        sp=request.getParameter("specialization");
        in=request.getParameter("insurance");
        doc=request.getParameter("doctorbio");
        fi=request.getParameter("file");
        im=request.getParameter("image");
      
      
   

 try{

//PreparedStatement pst=connection.prepareStatement("update doctorregister set  fname=? , lname=?,email=?,phone=?,npino=?,country=?, address=?,qualification=?,experience=?,specialization=?,insurance=?,doctorbio=?,file=?,image=? where email='"+em+"'");
    PreparedStatement pst = connection.prepareStatement("select * from doctorregister");

    pst.setString(1,fn);
    pst.setString(2,ln);
    pst.setString(3,em);
    pst.setString(4,ph);
    pst.setString(5,npi);
    pst.setString(6,co);
    pst.setString(7,add);
    pst.setString(8,qu);
    pst.setString(9,ex);
    pst.setString(10,sp);
    pst.setString(11,in);
    pst.setString(12,doc);
    pst.setString(13,fi);
    pst.setString(14,im);
   
    pst.executeUpdate();
   response.sendRedirect("adminprofile.jsp?email="+em);
    



connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>

    
</body>
</html>

