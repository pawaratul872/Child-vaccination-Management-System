<%-- 
    Document   : Welcome
    Created on : 15-Oct-2023, 3:06:53 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .receptionForm{
                width: 800px !important;
                left: 60% !important;
                height: 700px !important;
            }
            .background{
                width: 800px !important;
            }
            .shape:last-child{
                right: -125px;
                bottom: -590px;
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
    </head>
    <body>
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
                <form action="reception_user_vaccination_schedule_backend.jsp" method="post" class="receptionForm">
                    <h3>Reception UI</h3>
                    <div class="row">
                        <div class="col-6">
                            <label for="username">Username:</label>
                            <input type="text" name="username" required><br>
                            <label for="emailId" class="mt-0">Email Id:</label>
                            <input type="text" name="emailId" required><br>
                            <label for="mobileNo" class="mt-0">Mobile No:</label>
                            <input type="text" name="mobileNo" required><br>
                            <label for="ChildName" class="mt-0">Child Name:</label>
                            <input type="text" name="ChildName" required><br>
                        </div>
                        <div class="col-6">
                            <label for="ChildDOB">Child DOB:</label>
                            <input type="date" name="ChildDOB" required><br>
                            <label for="presentDate" class="mt-0">Present Date:</label>
                            <input type="date" name="presentDate" required><br>
                            <label for="drName" class="mt-0 mb-0">DR Name:</label>
                            <select class="select" name="drName">
                                <option>
                                    DR Pawar
                                </option>
                                <option>
                                    DR Shaikh
                                </option>
                            </select><br>
                            <label for="reason" class="mt-0 mb-0">Reason Visit:</label><br>
                            <select class="select"  name="reason">
                                <option>
                                    Vaccination
                                </option>
                                <option>
                                    Enquiry
                                </option>
                            </select>
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
