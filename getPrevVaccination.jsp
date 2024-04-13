<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%
    String selectedValue = request.getParameter("vaccinationName");

    // Your code to retrieve the next row data based on the selected value
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatementID = null;
    ResultSet resultSetID = null;
    String nextRowData = "";
    int id = 0;

    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
        String query = "SELECT id,vaccineName FROM vaccine WHERE vaccineName = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, selectedValue);
        resultSet = preparedStatement.executeQuery();

        // Assuming you want to display the data in a simple format
        while (resultSet.next()) {
            id = resultSet.getInt("id");
            // Add more columns as needed
        }
        String query1 = "SELECT * FROM vaccine WHERE id < ? ORDER BY id DESC LIMIT 1";
        preparedStatementID = connection.prepareStatement(query1);
        preparedStatementID.setInt(1, id);
        resultSetID = preparedStatementID.executeQuery();
        while (resultSetID.next()) {
            nextRowData += resultSetID.getString("vaccineName");
            // Add more columns as needed
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources (ResultSet, PreparedStatement, Connection) in a finally block
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Output the next row data as HTML
    out.println(nextRowData);
%>
