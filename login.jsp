<%-- 
    Document   : login
    Created on : 08-Oct-2023, 4:09:33 pm
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
<head>
      <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="row" style="width:100%;">
        <div class="col-md-7 col-sm-12">
             <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form action="Loginbackend.jsp" method="post">
        <h3>Login Here</h3>
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br>
        <!--<a>Forget Password</a>-->
         <button type="submit" class="mt-5" style="width: 95%">Log In</button>

    </form>
            </div>
         <div class="col-md-5 col-sm-12">
             <img src="Assets/Images/login.svg" style="margin-top:25%;">
        </div>
    </div>
</body>
</html>


