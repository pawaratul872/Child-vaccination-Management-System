<%-- 
    Document   : Dashboard
    Created on : 02-Oct-2023, 4:32:28 pm
    Author     : Dell
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet resultset = null;
    ResultSet resultset1 = null;
    ResultSet resultset2 = null;
    ResultSet resultset3 = null;
    int enquryCount = 0;
   int vaccinationCount =0;
    int drCount =0;
    int receptionCount =0;
    String s = null;
    try {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");
        Statement statement = connection.createStatement();
        Statement statement1 = connection.createStatement();
        Statement statement2 = connection.createStatement();
        Statement statement3 = connection.createStatement();
        resultset = statement.executeQuery("SELECT COUNT(username) FROM reception_user_vaccination_schedule WHERE reason='Enquiry'; ");
        resultset1 = statement1.executeQuery("SELECT COUNT(username) FROM doctor_user_vaccination_schedule; ");
        resultset2 = statement2.executeQuery("SELECT COUNT(doctorName) FROM doctors_registration; ");
        resultset3 = statement3.executeQuery("SELECT COUNT(receptionName) FROM receptions_registration; ");

        while (resultset.next()) {
            enquryCount=resultset.getInt(1);
        }
        while (resultset1.next()) {
            vaccinationCount=resultset1.getInt(1);
        }
        while (resultset2.next()) {
            drCount=resultset2.getInt(1);
        }
        while (resultset3.next()) {
            receptionCount=resultset3.getInt(1);
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            .ag-format-container {
                margin: 0 auto;
            }

            .ag-courses_box {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: start;
                -ms-flex-align: start;
                align-items: flex-start;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;

                padding: 50px 0;
            }
            .ag-courses_item {
                -ms-flex-preferred-size: calc(33.33333% - 30px);
                flex-basis: calc(33.33333% - 30px);

                margin: 0 15px 30px;

                overflow: hidden;

                border-radius: 28px;
            }
            .ag-courses-item_link {
                display: block;
                padding: 30px 20px;
                background-color: #121212;

                overflow: hidden;

                position: relative;
            }
            .ag-courses-item_link:hover,
            .ag-courses-item_link:hover .ag-courses-item_date {
                text-decoration: none;
                color: #FFF;
            }
            .ag-courses-item_link:hover .ag-courses-item_bg {
                -webkit-transform: scale(10);
                -ms-transform: scale(10);
                transform: scale(10);
            }
            .ag-courses-item_title {
                min-height: 87px;
                margin: 0 0 25px;

                overflow: hidden;

                font-weight: bold;
                font-size: 30px;
                color: #FFF;

                z-index: 2;
                position: relative;
            }
            .ag-courses-item_date-box {
                font-size: 18px;
                color: #FFF;

                z-index: 2;
                position: relative;
            }
            .ag-courses-item_date {
                font-weight: bold;
                color: #f9b234;

                -webkit-transition: color .5s ease;
                -o-transition: color .5s ease;
                transition: color .5s ease
            }
            .ag-courses-item_bg {
                height: 128px;
                width: 128px;
                background-color: #f9b234;

                z-index: 1;
                position: absolute;
                top: -75px;
                right: -75px;

                border-radius: 50%;

                -webkit-transition: all .5s ease;
                -o-transition: all .5s ease;
                transition: all .5s ease;
            }
            .ag-courses_item:nth-child(2n) .ag-courses-item_bg {
                background-color: #3ecd5e;
            }
            .ag-courses_item:nth-child(3n) .ag-courses-item_bg {
                background-color: #e44002;
            }
            .ag-courses_item:nth-child(4n) .ag-courses-item_bg {
                background-color: #952aff;
            }
            .ag-courses_item:nth-child(5n) .ag-courses-item_bg {
                background-color: #cd3e94;
            }
            .ag-courses_item:nth-child(6n) .ag-courses-item_bg {
                background-color: #4c49ea;
            }



            @media only screen and (max-width: 979px) {
                .ag-courses_item {
                    -ms-flex-preferred-size: calc(50% - 30px);
                    flex-basis: calc(50% - 30px);
                }
                .ag-courses-item_title {
                    font-size: 24px;
                }
            }

            @media only screen and (max-width: 767px) {
                .ag-format-container {
                    width: 96%;
                }

            }
            @media only screen and (max-width: 639px) {
                .ag-courses_item {
                    -ms-flex-preferred-size: 100%;
                    flex-basis: 100%;
                }
                .ag-courses-item_title {
                    min-height: 72px;
                    line-height: 1;

                    font-size: 24px;
                }
                .ag-courses-item_link {
                    padding: 22px 40px;
                }
                .ag-courses-item_date-box {
                    font-size: 16px;
                }
            }

            .header{
                width: 102% !important;
                background: linear-gradient( #1845ad, #23a2f6 ) !important;
                font-size: 16px;
                font-family: calibri;
                font-weight: 600;
                z-index: 1000;
                display: flex;
                flex-direction: row;
                align-items: center;
                padding: 10px 30px;
                position: fixed;
                width: 100%;
                height: 80px;
                left: 0px;
                top: 0px;
                box-shadow: 0px 4px 4px #0000001a;
            }

            .sidebar{
                width: 100% !important;
                background: #2089e2 !important;
                    height: 100vh !important;
            }

            .navList{
                background-color: unset !important;
                padding: 15px 35px !important;
                color: #fff!important;
            }

/*            .navList:hover{
                background: linear-gradient( #1845ad, #23a2f6 )!important;
                color: #fff!important;
            }*/
            .menuIcons{
                height: 20px;
                margin-top: 15px;
            }

        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-12">
                <div class="w3-container w3-teal header">
                    <div style="display:flex;">
                        <img src="Assets/Images/menuStepper.svg" class="menuIcons">
                        <h3 class="w3-bar-item ps-1" style="color: #fff!important;margin-left:10px;">Dashboard</h3>
                        <button type="button" class="btn btn-danger" style="position: relative;
                                right: 0;
                                left: 1210px;"
                                onclick="window.location = 'login.jsp'">
                            Logout <span class="badge">✘</span>
                        </button>
                    </div>
                </div>
            </div>

        </div>

        <div class="row" style="position: absolute;
             width: 100%;
             top: 5rem;
             z-index: 1;">

            <div class="col-2 p-0">
                <div class="w3-sidebar w3-light-grey w3-bar-block sidebar">
                    <a href="Reception_registration.jsp" class="w3-bar-item w3-button navList mt-3">Reception Registration</a>
                    <a href="Doctor_registration.jsp" class="w3-bar-item w3-button navList">Doctor Registration</a>
                </div>

            </div>
            <div class="col-10 p-0">

                <div class="ag-format-container" style="padding-left: 20px;">
                    <div class="ag-courses_box">
                        <div class="ag-courses_item">
                            <a href="#" class="ag-courses-item_link">
                                <div class="ag-courses-item_bg"></div>

                                <div class="ag-courses-item_title">
                                    Enquiry Count
                                </div>

                                <div class="ag-courses-item_date-box">
                                    <span class="ag-courses-item_date">
                                        <%= enquryCount%>
                                    </span>
                                </div>
                            </a>
                        </div>

                        <div class="ag-courses_item">
                            <a href="#" class="ag-courses-item_link">
                                <div class="ag-courses-item_bg"></div>

                                <div class="ag-courses-item_title">
                                    Vaccinated Count
                                </div>

                                <div class="ag-courses-item_date-box">
                                    <span class="ag-courses-item_date">
                                        <%= vaccinationCount%>
                                    </span>
                                </div>
                            </a>
                        </div>

                        <div class="ag-courses_item">
                            <a href="#" class="ag-courses-item_link">
                                <div class="ag-courses-item_bg"></div>

                                <div class="ag-courses-item_title">
                                    Working Doctors
                                </div>

                                <div class="ag-courses-item_date-box">
                                    <span class="ag-courses-item_date">
                                        <%= drCount%>
                                    </span>
                                </div>
                            </a>
                        </div>

                        <div class="ag-courses_item">
                            <a href="#" class="ag-courses-item_link">
                                <div class="ag-courses-item_bg"></div>

                                <div class="ag-courses-item_title">
                                    Working Receptionist
                                </div>

                                <div class="ag-courses-item_date-box">
                                    <span class="ag-courses-item_date">
                                        <%= receptionCount%>
                                    </span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
