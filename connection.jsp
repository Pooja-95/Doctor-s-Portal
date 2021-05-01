<%-- 
    Document   : connection
    Created on : Feb 27, 2020, 11:40:55 PM
    Author     : Archal Gupta
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%              Class.forName("com.mysql.jdbc.Driver");
                
                Connection connection = DriverManager.getConnection ("jdbc:mysql://localhost:3306/doctor","root","root");
              
%>