<%@ page import="javax.mail.internet.MimeMessage.RecipientType" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>

<%
    String username = request.getParameter("userName");

    // Database Connection
    Connection connection = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;

    ArrayList<String> userData = new ArrayList<>();

    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");

        String query1 = "SELECT * FROM doctor_user_vaccination_schedule WHERE username = ?";
        preparedStatement = connection.prepareStatement(query1);
        preparedStatement.setString(1, username);
        resultSet = preparedStatement.executeQuery();

        StringBuilder tableContent = new StringBuilder();
         String childName = "";
          String childDOB = "";
          String mobileNo="";
        while (resultSet.next()) {
         childName = resultSet.getString("childName");
            childDOB = resultSet.getString("childDOB");
            mobileNo = resultSet.getString("mobileNo");
            tableContent.append("<tr>");
            tableContent.append("<td style=' border: 1px solid #dddddd;text-align: left;padding: 8px;'>").append(resultSet.getString("vaccinationName")).append("</td>");
            tableContent.append("<td style=' border: 1px solid #dddddd;text-align: left;padding: 8px;'>").append(resultSet.getString("presentDate")).append("</td>");
            tableContent.append("</tr>");
        }

        // Read the JSP template from a file (or define it as a String)
        String templateContent = "<html><!-- Complete Email template -->" +
            "<body style='background-color: lightgray;overflow:hidden;'>" +
            "   <div style='width:100%; display:flex; background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%); color:white; padding:10px 15px; font-size:18px; font-weight:800;'>" +
            "       Child Vaccination System" + "&#128118;"+
            "   </div>" +
            "   <div style='display:flex;justify-content: center;padding:5px 15px;font-size: 18px;margin-top: 11px;'>"+    
            "   <div style='color:#053bff;'>Child Vaccination Details Report.</div>" +    
            "   </div>"+
            "   <div style='display:flex; width:100%'>"+
            "   <div style='width:50%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
            "       Child Name :  ${childName}" +
            "   </div>" +
            "   <div style='width:50%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
            "       Parent Mobile No : ${mobileNo}" + 
            "   </div>" +
            "   </div>" +
            "   <div style='width:100%; padding:5px 15px; font-size:18px; font-weight:300;'>" +
            "       Child DOB : ${childDOB}" +
            "   </div>" +
            "   <table style='font-family: arial, sans-serif;border-collapse: collapse;width: 100%;'>" +
            "       <tr>" +
            "       <th style=' border: 1px solid #dddddd;text-align: left;padding: 8px;'>" +
            "        Vaccination Name" +
            "       </th>" +
            "       <th style=' border: 1px solid #dddddd;text-align: left;padding: 8px;'>" +
            "        Vaccination Date" +
            "       </th>" +
            "       </tr>" +
            "       <!-- Table Data Here -->" +
            tableContent.toString() +
            "   </table>" +
            "</body>" +
            "</html>";

        // Replace placeholders in the template with dynamic content
        String userName = "John Doe"; // Replace with actual user data
        String personalizedContent = templateContent.replace("${childName}", childName)
        .replace("${mobileNo}", mobileNo)
        .replace("${childDOB}", childDOB);

        // Send Email
        String result;
        String to = "mailtorizwan01@gmail.com";
        String from = "rizwanshaikhrizu@gmail.com";
        String pass = "mboe yplo yvri vuhn";
        String host = "smtp.gmail.com";

        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", from);
        properties.put("mail.password", pass);
        properties.put("mail.smtp.port", "587");

        Session emailSession = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(emailSession);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Child Vaccination Report");
            message.setText(personalizedContent, "UTF-8", "html");
            Transport.send(message);
            result = "Mail sent successfully";
            out.println("Sent mail successfully...");
        } catch (MessagingException mex) {
            mex.printStackTrace();
            result = "Error sending mail";
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<html>
    <head>
        <title>Sending mail via JSP</title>
    </head>
</html>
