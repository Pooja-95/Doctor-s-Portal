<%@page import="java.util.Properties"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
         Properties properties = new Properties();
         properties.setProperty("user", "root");
         properties.setProperty("password", "root");
         properties.setProperty("useSSL", "false");
         properties.setProperty("autoReconnect", "true");
         String connectionURL = "jdbc:mysql://localhost:3306/doctor";
%>
<!DOCTYPE html>
<html>
<body>
<h1>Search Data</h1>
<table border="1">
<tr>
<td>First_Name</td>
<td>Last_Name</td>
<td>Email Id</td>
<td>Country</td>
<td>image</td>
</tr>
<%
try{
String country=request.getParameter("country");
String specialization=request.getParameter("specialization");
String insurance=request.getParameter("insurance");
 
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection connection = DriverManager.getConnection(connectionURL,properties);
 System.out.print("Connection succesful");

Statement statement=connection.createStatement();
String sql ="select * from doctorregister where country='"+country+"' AND specialization='"+specialization+"' AND insurance='"+insurance+"' OR country='"+country+"' AND specialization='"+specialization+"'OR country='"+country+"' AND insurance='"+insurance+"' OR  specialization='"+specialization+"' AND insurance='"+insurance+"' OR  country='"+country+"' OR  specialization='"+specialization+"' OR  insurance='"+insurance+"' ";
ResultSet resultSet = statement.executeQuery(sql);

while(resultSet.next()){

%>
<tr>
    
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("country") %></td>
<td><%=resultSet.getString("image") %></td>
</tr>
<%
//    response.sendRedirect("appointment.html");
}
connection.close();
} catch (Exception e) {
out.println("Exception in connection "+e.getMessage());}
%>
</table>
</body>
</html>