<%-- 
    Document   : dr_vaccination_to_users_backend
    Created on : 24-Oct-2023, 12:03:14 pm
    Author     : Dell
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.mail.internet.MimeMessage.RecipientType" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% 
    String url = "jdbc:mysql://localhost:3306/vaccinationDB";
    String username = request.getParameter("userName");
    String emailId = request.getParameter("emailId");
    String mobileNo = request.getParameter("mobileNo");
    String childDOB = request.getParameter("childDOB");
    String childName = request.getParameter("childName");
    String presentDate = request.getParameter("presentDate");
    String prevVaccinationName = request.getParameter("prevVaccinationName");
    String vaccinationName = request.getParameter("vaccinationName");
    String nextAppointmentDate = request.getParameter("nextAppointmentDate");
    String nextVaccination = request.getParameter("nextVaccination");
    

    // Perform database connection and authentication
    // You will need to import necessary libraries and create a database connection here.
    // Query the database to validate the user.

    // Example database connection and query using JDBC (you need to replace with your database details):
    
   Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
} catch (Exception e) {
    e.printStackTrace();
}

String insertQuery = "INSERT INTO doctor_user_vaccination_schedule (username, emailId, "
        + "mobileNo, childDOB, childName, presentDate, prevVaccinationName, vaccinationName, nextAppointmentDate, nextVaccination) "
        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
try {
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);
    pstmt.setString(1, username);
    pstmt.setString(2, emailId);
    pstmt.setString(3, mobileNo);
    pstmt.setString(4, childDOB);
    pstmt.setString(5, childName);
    pstmt.setString(6, presentDate);
    pstmt.setString(7, prevVaccinationName);
    pstmt.setString(8, vaccinationName);
    pstmt.setString(9, nextAppointmentDate);
    pstmt.setString(10, nextVaccination);
    pstmt.executeUpdate();
    
    
    
//    mail funcionality
    // Read the JSP template from a file (or define it as a String)
    String templateContent = "<html><!-- Complete Email template -->" +
        "<body style='background-color: lightgray;overflow:hidden;'>" +
        "   <div style='width:100%; display:flex; background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%); color:white; padding:10px 15px; font-size:18px; font-weight:800;'>" +
        "       Child Vaccination System" + "&#128118;"+
        "   </div>" +
        "   <div style='display:flex;justify-content: center;padding:5px 15px;font-size: 18px;margin-top: 11px;'>"+    
        "   <div style='color:#053bff;'>Congratulations for your child vaccination!!! this are details.</div>" +   
        " &#127881;" +  
        "   </div>"+
        "   <div style='width:100%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
        "       Child Name : ${childName}" +
        "   </div>" +
        "   <div style='width:100%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
        "       Present Date : ${presentDate}" +
        "   </div>" +
        "   <div style='width:100%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
        "       Vaccination Name : ${vaccinationName}" +
        "   </div>" +
        "   <div style='width:100%; padding:10px 15px; font-size:18px; font-weight:300;'>" +
        "       Previous Vaccination Name : ${prevVaccinationName}" +
        "   </div>" +
        "   <div style='width:100%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
        "       Next Vaccination Name : ${nextVaccination}" +
        "   </div>" +
        "   <div style='width:100%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
        "       Next Appointment Date : ${nextAppointmentDate}" +
        "   </div>" +
        "</body>" +
        "</html>";


    // Replace placeholders in the template with dynamic content
    String userName = "John Doe"; // Replace with actual user data
    String personalizedContent = templateContent.replace("${childName}", childName)
        .replace("${presentDate}", presentDate)
        .replace("${vaccinationName}", vaccinationName)
        .replace("${prevVaccinationName}", prevVaccinationName)
        .replace("${nextVaccination}", nextVaccination)
        .replace("${nextAppointmentDate}", nextAppointmentDate);

    String result;
    String to = "mailtorizwan01@gmail.com";
    
    // Sender's email id and password
    String from = "rizwanshaikhrizu@gmail.com";
    String pass = "mboe yplo yvri vuhn";
    
    // Gmail host
    String host = "smtp.gmail.com"; // This is the SMTP server host, change it as needed

    // Get system properties
    Properties properties = System.getProperties();

    // Setup mail server
    properties.put("mail.smtp.host", host);
    properties.put("mail.transport.protocol", "smtp");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.user", from);
    properties.put("mail.password", pass);
    properties.put("mail.smtp.port", "587");

    // Get the default Session object.
    Session emailSession = Session.getInstance(properties, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(emailSession);

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

        // Set Subject: header field
        message.setSubject("Subject Here");

        // Now set the actual message
        message.setText(personalizedContent, "UTF-8", "html");

        // Send message
        Transport.send(message);
        String encodedUserName = URLEncoder.encode(username, "UTF-8");
        response.sendRedirect("child_Vaccination_Report.jsp?username=" + encodedUserName); 
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error sending mail";
        out.println("Error: " + mex.getMessage());
    }
} catch (SQLException e) {
    e.printStackTrace();
}

try {
    if (conn != null) {
        conn.close();
    }
} catch (SQLException e) {
    e.printStackTrace();
}

%>