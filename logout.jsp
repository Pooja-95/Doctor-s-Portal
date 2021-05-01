<%-- 
    Document   : logout
    Created on : Feb 17, 2020, 4:57:59 PM
    Author     : Archal Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
    </head>
    <body>
     
        <%
            session.invalidate();
            response.sendRedirect("login.html");
        %>
            
        
    </body>
</html>
                