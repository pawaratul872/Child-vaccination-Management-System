



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Perform database connection and authentication
    // You will need to import necessary libraries and create a database connection here.
    // Query the database to validate the user.

    // Example database connection and query using JDBC (you need to replace with your database details):
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM usersLogin WHERE username='" + username + "' AND password='" + password + "'");
        
        if (rs.next()) {
            // User authenticated successfully, redirect to a welcome page.
             String role = rs.getString("roleName");
            if ("Reception".equals(role)) {
                response.sendRedirect("Reception_user_vaccination_Schedule.jsp");
            } else if ("Doctor".equals(role)) {
                response.sendRedirect("dr_vaccination_to_users.jsp");
            } else if ("Admin".equals(role)) {
                response.sendRedirect("Dashboard.jsp");
            }else{
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
