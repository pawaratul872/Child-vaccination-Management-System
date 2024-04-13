<%-- 
    Document   : Doctor_registration_backend
    Created on : 15-Nov-2023, 5:50:20 pm
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
    String receptionName = request.getParameter("receptionName");
    String receptionDOB = request.getParameter("receptionDOB");
    String receptionQualifications = request.getParameter("receptionQualifications");
    String receptionMail = request.getParameter("receptionMail");
    String receptionMobile = request.getParameter("receptionMobile");
    String receptionAddress = request.getParameter("receptionAddress");

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

String insertQuery = "INSERT INTO doctors_registration (doctorName, doctorDOB, doctorQualifications, doctorMail, doctorMobile, doctorAddress) "
        + "VALUES (?, ?, ?, ?, ?, ?)";

String insertQueryInLogin = "INSERT INTO usersLogin ( username, password, roleName) "
        + "VALUES (?, ?, ?)";        

try {
    PreparedStatement pstmtLogin = conn.prepareStatement(insertQueryInLogin);
    pstmtLogin.setString(1, receptionMail);
    pstmtLogin.setString(2, "Pass123");
    pstmtLogin.setString(3, "Doctor");
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);
    pstmt.setString(1, receptionName);
    pstmt.setString(2, receptionDOB);
    pstmt.setString(3, receptionQualifications);
    pstmt.setString(4, receptionMail);
    pstmt.setString(5, receptionMobile);
    pstmt.setString(6, receptionAddress);
    pstmt.executeUpdate();
    pstmtLogin.executeUpdate();
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