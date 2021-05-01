<%-- 
    Document   : adminchangepassword
    Created on : Mar 5, 2020, 3:58:40 PM
    Author     : Archal Gupta
--%>
<%@page import="java.sql.*"%>
<%@include file = "connection.jsp" %>
<%-- 
    Document   : changepassword
    Created on : Feb 13, 2020, 4:17:38 PM
    Author     : Archal Gupta
--%>
<html>
    <head>
        
    </head>
    <body>
<%
String em=request.getParameter("email");
String currentpassword=request.getParameter("current");
String newpass=request.getParameter("new");

String pass;
int i=0;
try{
Statement st = connection.createStatement();
out.println(" "+em);
ResultSet rs=st.executeQuery("select password from admin where email='"+em+"'");
rs.next();
pass = rs.getString(1);
if(pass.equals(currentpassword)){
Statement st1=connection.createStatement();
 i=st1.executeUpdate("update admin set password='"+newpass+"' where email='"+em+"' and password='"+pass+"'");
out.println("Password changed successfully");
response.sendRedirect("adminprofile.jsp?email="+em+"&password="+newpass);
st1.close();
connection.close();
}
else{
out.println("Invalid Current Password"+em);
}
}
catch(Exception e){
out.println(e);
}
%>
</body>
</html>