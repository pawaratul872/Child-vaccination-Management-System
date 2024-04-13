<%-- 
    Document   : Reception_registration
    Created on : 15-Nov-2023, 4:53:45 pm
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
                height: 900px !important;
            }
            .background{
                width: 800px !important;
            }
            .shape:last-child{
                right: -125px;
                bottom: -820px;
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
            input{
                width: 98% !important;
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
                <!--action="reception_user_vaccination_schedule_backend.jsp"-->     
                <form  method="post" class="receptionForm" action="reception_registration_backend.jsp">
                    <h3>Receptions Registration UI</h3>
                    <div class="row">
                        <div class="col-12">
                            <label for="username">Reception Name:</label>
                            <input type="text" name="receptionName" required><br>
                            <label for="emailId" class="mt-0">Reception DOB</label>
                            <input type="date" name="receptionDOB" required><br>
                            <label for="mobileNo" class="mt-0">Reception Qualifications:</label>
                            <input type="text" name="receptionQualifications" required><br>
                            <label for="ChildName" class="mt-0">Reception Mail Id:</label>
                            <input type="text" name="receptionMail" required><br>
                            <label for="ChildName" class="mt-0">Reception Mobile:</label>
                            <input type="text" name="receptionMobile" required><br>
                            <label for="ChildName" class="mt-0">Reception Address:</label>
                            <input type="text" name="receptionAddress" required><br>
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

