<%-- 
    Document   : reception_user_vaccination_schedule_backend
    Created on : 22-Oct-2023, 4:10:54 pm
    Author     : Dell
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
    String url = "jdbc:mysql://localhost:3306/vaccinationDB";
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
   Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
} catch (Exception e) {
    e.printStackTrace();
}

String insertQuery = "INSERT INTO reception_user_vaccination_schedule (username, emailId, mobileNo, ChildName, ChildDOB, presentDate, drName, reason) "
        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

try {
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);
    pstmt.setString(1, username);
    pstmt.setString(2, emailId);
    pstmt.setString(3, mobileNo);
    pstmt.setString(4, ChildName);
    pstmt.setString(5, ChildDOB);
    pstmt.setString(6, presentDate);
    pstmt.setString(7, drName);
    pstmt.setString(8, reason);
    pstmt.executeUpdate();
    response.sendRedirect("Reception_user_vaccination_Schedule.jsp"); 
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

