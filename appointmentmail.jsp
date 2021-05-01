<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "connection.jsp" %>
<%

    //Creating a result for getting status that messsage is delivered or not!

    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("docemail");
    final String fname = request.getParameter("fname");
    final String lname = request.getParameter("lname");
    final String email = request.getParameter("email");
    final String time  = request.getParameter("time");
    final String date  = request.getParameter("date");
    final String Link  = request.getParameter("link");
    final String file  = request.getParameter("file");
    final String subject ="new appointment";
    final String messg =  "Hello sir/mam"
            + "\n you ghave got an appoinment form "+ fname +" "+lname + " "+email
            +"\n" + time 
            + "\n "+date
            +"\n"+ Link + " "+ file ;
    //final String subject = request.getParameter("sub");

    //final String messg = request.getParameter("mess");

 PreparedStatement st = connection.prepareStatement("INSERT INTO `appointment` ( `doctoremail`,`patientemail` ,`time` ,`date`) VALUES('"+to+"','"+email+"','"+time+"','"+date+"')");
  
  st.executeUpdate();
    // Sender's email ID and password needs to be mentioned

    final String from = "guptaarchal@gmail.com";

    final String pass = "archalgupta1997";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

            message.addRecipient(Message.RecipientType.TO,

                    new InternetAddress(to));

        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";
        response.sendRedirect("loginshow.jsp");
    }
    
%>

<title>Sending Mail in JSP</title>

<h1><center><font color="blue">Sending Mail Using JSP</font></h1>

<b><center><font color="red"><% out.println(result);%></b>