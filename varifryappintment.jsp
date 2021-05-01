<%-- 
    Document   : varifryappintment
    Created on : Mar 14, 2020, 10:40:23 PM
    Author     : Archal Gupta
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page import="java.util.Properties"%>
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
        <h1>Hello World!</h1>
        <%
       String email=request.getParameter("email");
       String aid=request.getParameter("aid");
       String time=request.getParameter("time");
       String date=request.getParameter("date");
       
PreparedStatement pst=connection.prepareStatement("update appointment set verify=1 and time='"+time+"' and date='"+ date+"' where idappointment='"+aid+"'");
    pst.executeUpdate();
   response.sendRedirect("mail1.jsp?email="+email);
        %>
        
        
    </body>
</html>
