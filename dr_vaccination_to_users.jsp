<%-- 
    Document   : Welcome
    Created on : 15-Oct-2023, 3:06:53 pm
    Author     : Dell
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="com.Email.custompackage" %>--%>
<%
    ResultSet resultset = null;
    ResultSet resultset1 = null;
    ArrayList<String> vaccineNames = new ArrayList<>();
    String username = null;
    String Email = null;
    String MobileNo = null;
    String childName = null;
    String childDob = null;
    String presentDate = null;
    String s = null;
    try {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
        Statement statement = connection.createStatement();
        Statement statement1 = connection.createStatement();
        resultset = statement.executeQuery("select * from vaccine");
        resultset1 = statement1.executeQuery("SELECT * FROM reception_user_vaccination_schedule ORDER BY id DESC LIMIT 1");

        while (resultset.next()) {
            vaccineNames.add(resultset.getString(2));
        }
        while (resultset1.next()) {
            username = resultset1.getString("username");
            Email = resultset1.getString("emailId");
            MobileNo = resultset1.getString("mobileNo");
            childName = resultset1.getString("ChildName");
            childDob = resultset1.getString("ChildDOB");
            presentDate = resultset1.getString("presentDate");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultset != null) {
            try {
                resultset.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
<%--<%@ page import="receptionObject.receptionObject" %>
<%@page import="receptionObject.getDataToDoctor"%>

<%
    // Fetch the last record from the database
    receptionObject lastRecord = getDataToDoctor.getLastRecord();
%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .receptionForm{
                width: 800px !important;
                left: 60% !important;
                height: 800px !important;
            }
            .background{
                width: 800px !important;
            }
            .shape:last-child{
                right: -125px;
                bottom: -700px;
            }
            .select{
                display: block;
                height: 50px;
                width: 95%;
                background-color: rgb(105 84 84 / 6%);
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 8px;
                font-size: 14px;
                font-weight: 300;
            }
            body{
                background-color: #ffffff !important;
                padding: 1%;
            }

        </style>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $("#vaccinationName").change(function () {
                    var selectedValue = $(this).val();

                    // Make an AJAX request to fetch next row data
                    $.ajax({
                        type: "POST",
                        url: "getNextVaccination.jsp", // replace with the actual JSP file to handle the AJAX request
                        data: {vaccinationName: selectedValue},
                        success: function (data) {
                            $("#nextVaccination").val(data);
                        },
                        error: function () {
                            alert("Error fetching data");
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: "getPrevVaccination.jsp", // replace with the actual JSP file to handle the AJAX request
                        data: {vaccinationName: selectedValue},
                        success: function (data) {
                            $("#prevVaccinationName").val(data);
                        },
                        error: function () {
                            alert("Error fetching data");
                        }
                    });
                     $.ajax({
                        type: "POST",
                        url: "mailsender.jsp", // replace with the actual JSP file to handle the AJAX request
                       
                    });
                });
            });
        </script>
        <button type="button" class="btn btn-danger" style="float:right; width: 7%"
                onclick="window.location = 'login.jsp'">
            Logout <span class="badge">✘</span>
        </button>
       
        <div class="row" style="width:100%;">
            <div class="col-md-8 col-sm-12">
                <div class="background">
                    <div class="shape"></div>
                    <div class="shape"></div>
                </div>
                <form action="dr_vaccination_to_users_backend.jsp" method="post" class="receptionForm">
                    <h3>Doctor UI</h3>
                    <div class="row">
                        <div class="col-6">
                            <label for="username">Username:</label>
                            <input type="text" name="userName" value="<%= username%>" readOnly><br>
                            <label for="emailId" class="mt-0">Email Id:</label>
                            <input type="text" name="emailId" value="<%= Email%>" readOnly><br>
                            <label for="mobileNo" class="mt-0">Mobile No:</label>
                            <input type="text" name="mobileNo" value="<%= MobileNo%>" readOnly><br>
                            <label for="ChildName" class="mt-0">Child Name:</label>
                            <input type="text" name="childName" value="<%= childName%>" readOnly>
                            <label for="ChildDOB">Child DOB:</label>
                            <input type="date" name="childDOB" value="<%= childDob%>" readOnly><br>
                        </div>
                        <div class="col-6">
                            <label for="presentDate" >Present Date:</label>
                            <input type="date" name="presentDate" value="<%= presentDate%>" readOnly><br>
                            <label for="ChildDOB" class="mt-0">Previous Vaccination Name:</label>
                            <input type="text" name="prevVaccinationName" id="prevVaccinationName" readOnly><br>
                            <label for="drName" class="mt-0 mb-0">Vaccination Name:</label>
                            <select class="select" name="vaccinationName" id="vaccinationName">
                                <% for (String name : vaccineNames) {%>
                                <option><%= name%></option>
                                <% }%>
                            </select><br>
                            <label for="ChildDOB" class="mt-0">Next Appointment Date:</label>
                            <input type="date" name="nextAppointmentDate" required><br>
                            <label for="reason" class="mt-2 mb-0">Next Vaccination:</label><br>
                            <input type="text" name="nextVaccination" id="nextVaccination" readOnly><br>
                        </div>
                    </div>


                    <button type="submit" class="mt-5" style="width: 98%">Submit</button>
                </form>
            </div>
            <div class="col-md-4 col-sm-12">
                <img src="Assets/Images/login.svg" style="margin-top:25%;">
            </div>
        </div>
    </body>
</html>
