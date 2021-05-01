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
        String fn,ln,add,em,pass,mob;
        int age;
        fn=request.getParameter("fname");
        ln=request.getParameter("lname");
        age=Integer.parseInt(request.getParameter("age"));
        em=request.getParameter("email");
        add=request.getParameter("address");
        mob=request.getParameter("mobile");
        pass=request.getParameter("password");

 try{

PreparedStatement pst=connection.prepareStatement("update register set  fname=? , lname=? , age=?, address=?,mobile=? where email='"+em+"'and password='"+pass+"'");
    

    pst.setString(1,fn);
    pst.setString(2,ln);
    pst.setInt(3,age);
    pst.setString(4,add);
    pst.setString(5,mob);
    pst.executeUpdate();
   response.sendRedirect("loginshow.jsp?email="+em+"&password="+pass);
    



connection.close();
} catch (Exception e) {
e.printStackTrace();
}

%>

    
</body>
</html>

