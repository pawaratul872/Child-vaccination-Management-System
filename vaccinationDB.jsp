<%-- 
    Document   : Reception_user_vaccination_schedule_backend
    Created on : 15-Oct-2023, 5:01:01 pm
    Author     : Dell
--%>





<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
    String username = request.getParameter("username");
    String emailId = request.getParameter("emailId");
    String mobileNo = request.getParameter("mobileNo");
    String ChildName = request.getParameter("ChildName");
    String ChildDOB = request.getParameter("ChildDOB");
    String presentDate = request.getParameter("presentDate");
    String drName = request.getParameter("drName");
    String reason = request.getParameter("reason");

    // Perform database connection and authentication
    // You will need to import necessary libraries and create a database connection here.
    // Query the database to validate the user.

    // Example database connection and query using JDBC (you need to replace with your database details):
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM reception_user_vaccination_schedule WHERE username='" + username + "' AND emailId='" + password + "'");
        
        if (rs.next()) {
            // User authenticated successfully, redirect to a welcome page.
             String role = rs.getString("roleName");
            if ("Reception".equals(role)) {
                response.sendRedirect("Reception_user_vaccination_Schedule.jsp");
            } else if ("user".equals(role)) {
                response.sendRedirect("user.jsp");
            } else {
                out.println("Unknown role."+role);
            }
            
        } else {
            // Authentication failed, show an error message.
            out.println("Invalid username or password.");
        }
        
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>

