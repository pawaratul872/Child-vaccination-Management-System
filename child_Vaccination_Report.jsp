<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="javax.mail.internet.MimeMessage.RecipientType" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Page 2</title>
    <style type="text/css">
        body{
            padding: 15px
        }
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
        .heading{
            background: -webkit-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(121,9,22,1) 35%, rgba(0,212,255,1) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 39px;
            font-weight: 700;
        }





        .confetti-container {
            user-select: none;
            z-index: 10;
        }
        .confetti {
            position: fixed;
            left: 0;
            right: 0;
            display: flex;
            /* width: 600px; */
            /* height: 600px; */
            /* overflow: hidden; */
        }

        .confetti .square {
            width: 1rem;
            height: 1rem;
            background-color: var(--bg);
            transform: rotate(-140deg);
        }

        .confetti .rectangle {
            width: 1rem;
            height: 0.5rem;
            background-color: var(--bg);
        }

        .confetti .hexagram {
            width: 0;
            height: 0;
            border-left: 0.5rem solid transparent;
            border-right: 0.5rem solid transparent;
            border-bottom: 1rem solid var(--bg);
            position: relative;
        }

        .confetti .hexagram:after {
            content: "";
            width: 0;
            height: 0;
            border-left: 0.5rem solid transparent;
            border-right: 0.5rem solid transparent;
            border-top: 1rem solid var(--bg);
            position: absolute;
            top: 0.33rem;
            left: -0.5rem;
        }

        .confetti .pentagram {
            width: 0rem;
            height: 0rem;
            display: block;
            margin: 0.5rem 0;
            border-right: 1rem solid transparent;
            border-bottom: 0.7rem solid var(--bg);
            border-left: 1rem solid transparent;
            transform: rotate(35deg);
            position: relative;
        }
        .confetti .pentagram:before {
            content: "";
            width: 0;
            height: 0;
            display: block;
            border-bottom: 0.8rem solid var(--bg);
            border-left: 0.3rem solid transparent;
            border-right: 0.3rem solid transparent;
            transform: rotate(-35deg);
            position: absolute;
            top: -0.45rem;
            left: -0.65rem;
        }
        .confetti .pentagram:after {
            content: "";
            width: 0rem;
            height: 0rem;
            display: block;
            border-right: 1rem solid transparent;
            border-bottom: 0.7rem solid var(--bg);
            border-left: 1rem solid transparent;
            transform: rotate(-70deg);
            position: absolute;
            top: 0.03rem;
            left: -1.05rem;
        }

        .confetti .dodecagram {
            background: var(--bg);
            width: 0.8rem;
            height: 0.8rem;
            position: relative;
        }

        .confetti .dodecagram:before {
            content: "";
            height: 0.8rem;
            width: 0.8rem;
            background: var(--bg);
            transform: rotate(30deg);
            position: absolute;
            top: 0;
            left: 0;
        }
        .confetti .dodecagram:after {
            content: "";
            height: 0.8rem;
            width: 0.8rem;
            background: var(--bg);
            transform: rotate(60deg);
            position: absolute;
            top: 0;
            left: 0;
        }

        .confetti .wavy-line {
            position: relative;
        }
        .confetti .wavy-line::after,
        .confetti .wavy-line::before {
            content: "";
            height: 1rem;
            width: 8rem;
            background-size: 2rem 1rem;
            position: absolute;
            left: -9rem;
            transform: rotate(90deg);
        }

        .confetti .wavy-line::before {
            background-image: linear-gradient(
                45deg,
                transparent,
                transparent 50%,
                var(--bg) 50%,
                transparent 60%
                );
            top: 1rem;
        }
        .confetti .wavy-line::after {
            background-image: linear-gradient(
                -45deg,
                transparent,
                transparent 50%,
                var(--bg) 50%,
                transparent 60%
                );
        }

        .confetti i {
            width: 3rem;
            height: 3rem;
            margin: 0 0.2rem;
            animation-name: confetti;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-duration: calc(70s / var(--speed));
        }

        .confetti i:nth-child(even) {
            transform: rotate(90deg);
        }

        @keyframes confetti {
            0% {
                transform: translateY(-100vh);
            }

            100% {
                transform: translateY(100vh);
            }
        }

        .vaccine{
            background: -webkit-linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(121,9,9,1) 35%, rgba(255,0,74,1) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;

        }


        .cssanimation, .cssanimation span {
            animation-duration: 1s;
            animation-fill-mode: both;
        }

        .cssanimation span {
            display: inline-block
        }

        .fadeInBottom {
            animation-name: fadeInBottom
        }
        @keyframes fadeInBottom {
            from {
                opacity: 0;
                transform: translateY(100%);
            }
            to {
                opacity: 1
            }
        }
        .printHeading{
            display:none;
        }

        @media print {
            /* Specify styles for printing */
            body {
                font-size: 12pt; /* Adjust font size for print */
            }

            /* Hide elements during print */
            .no-print {
                display: none !important;
            }
            .heading{
                display:none;
            }
            .printHeading{
                display:flex !important;
                font-size: 39px;
                font-weight: 700;
            }
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<div style="padding: 10px 15px;
     background-color: rgb(46 0 243 / 15%);
     position: absolute;
     top: 300px;
     left: 3%;
     font-size: 46px;
     width: 95%;
     font-weight: 800;
     backdrop-filter: blur(10px);
     border-radius: 18px;" class="cssanimation sequence fadeInBottom" id="vaccinationSuccess">        
    <p class="vaccine" style='margin-left: 20px' >Vaccination success, mail send on the child's parent email...</p>
</div>
<div class="confetti-container" id="myDiv">
    <div class="confetti">
        <i style="--speed: 10; --bg: yellow" class="square"></i>
        <i style="--speed: 18; --bg: white" class="pentagram"></i>
        <i style="--speed: 29; --bg: green" class="rectangle"></i>
        <i style="--speed: 17; --bg: blue" class="hexagram"></i>
        <i style="--speed: 33; --bg: red" class="pentagram"></i>
        <i style="--speed: 26; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 24; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 5; --bg: blue" class="wavy-line"></i>
        <i style="--speed: 40; --bg: white" class="square"></i>
        <i style="--speed: 17; --bg: green" class="rectangle"></i>
        <i style="--speed: 25; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 15; --bg: yellow" class="wavy-line"> </i>
        <i style="--speed: 32; --bg: yellow" class="pentagram"></i>
        <i style="--speed: 25; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 37; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 23; --bg: pink" class="wavy-line"></i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 37; --bg: pink" class="wavy-line"></i>
        <i style="--speed: 36; --bg: white" class="hexagram"></i>
        <i style="--speed: 32; --bg: green" class="wavy-line"></i>
        <i style="--speed: 32; --bg: yellow" class="pentagram"></i>
        <i style="--speed: 29; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 23; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 30; --bg: pink" class="rectangle"></i>
        <i style="--speed: 30; --bg: red" class="square"></i>
        <i style="--speed: 18; --bg: red" class="pentagram"></i>
        <i style="--speed: 19; --bg: green" class="rectangle"></i>
        <i style="--speed: 16; --bg: blue" class="hexagram"></i>
        <i style="--speed: 23; --bg: red" class="pentagram"></i>
        <i style="--speed: 34; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 39; --bg: pink" class="wavy-line"></i>
        <i style="--speed: 40; --bg: purple" class="square"></i>
        <i style="--speed: 21; --bg: green" class="rectangle"></i>
        <i style="--speed: 14; --bg: white" class="square"></i>
        <i style="--speed: 38; --bg: green" class="rectangle"></i>
        <i style="--speed: 19; --bg: red" class="dodecagram"></i>
        <i style="--speed: 29; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 21; --bg: white" class="hexagram"></i>
        <i style="--speed: 17; --bg: purple" class="wavy-line"></i>
        <i style="--speed: 32; --bg: yellow" class="pentagram"></i>
        <i style="--speed: 23; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 48; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 38; --bg: pink" class="rectangle"></i>
        <i style="--speed: 13; --bg: red" class="pentagram"></i>
        <i style="--speed: 49; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 19; --bg: cyan" class="wavy-line"></i>
        <i style="--speed: 15; --bg: steelblue" class="square"></i>
        <i style="--speed: 10; --bg: yellow" class="square"></i>
        <i style="--speed: 18; --bg: white" class="pentagram"></i>
        <i style="--speed: 29; --bg: green" class="rectangle"></i>
        <i style="--speed: 17; --bg: blue" class="hexagram"></i>
        <i style="--speed: 33; --bg: red" class="pentagram"></i>
        <i style="--speed: 26; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 24; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 5; --bg: white" class="wavy-line"></i>
        <i style="--speed: 40; --bg: purple" class="square"></i>
        <i style="--speed: 17; --bg: green" class="rectangle"></i>
        <i style="--speed: 25; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 15; --bg: cyan" class="wavy-line"> </i>
        <i style="--speed: 32; --bg: yellow" class="pentagram"></i>
        <i style="--speed: 45; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 23; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 37; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 26; --bg: white" class="hexagram"></i>
        <i style="--speed: 32; --bg: cyan" class="wavy-line"></i>
        <i style="--speed: 32; --bg: yellow" class="pentagram"></i>
        <i style="--speed: 45; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 23; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 50; --bg: pink" class="rectangle"></i>
        <i style="--speed: 30; --bg: red" class="square"></i>
        <i style="--speed: 18; --bg: red" class="pentagram"></i>
        <i style="--speed: 19; --bg: green" class="rectangle"></i>
        <i style="--speed: 16; --bg: blue" class="hexagram"></i>
        <i style="--speed: 23; --bg: red" class="pentagram"></i>
        <i style="--speed: 33; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 39; --bg: white" class="wavy-line"></i>
        <i style="--speed: 40; --bg: orange" class="square"></i>
        <i style="--speed: 21; --bg: green" class="rectangle"></i>
        <i style="--speed: 14; --bg: white" class="square"></i>
        <i style="--speed: 38; --bg: green" class="rectangle"></i>
        <i style="--speed: 19; --bg: red" class="dodecagram"></i>
        <i style="--speed: 29; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 34; --bg: white" class="hexagram"></i>
        <i style="--speed: 17; --bg: indigo" class="wavy-line"></i>
        <i style="--speed: 32; --bg: yellow" class="pentagram"></i>
        <i style="--speed: 23; --bg: white" class="square"></i>
        <i style="--speed: 18; --bg: green" class="rectangle"></i>
        <i style="--speed: 37; --bg: red" class="dodecagram"></i>
        <i style="--speed: 48; --bg: pink" class="wavy-line"> </i>
        <i style="--speed: 38; --bg: pink" class="rectangle"></i>
        <i style="--speed: 13; --bg: red" class="pentagram"></i>
        <i style="--speed: 49; --bg: yellow" class="dodecagram"></i>
        <i style="--speed: 19; --bg: purple" class="wavy-line"></i>
        <i style="--speed: 15; --bg: cyan" class="square"></i>
    </div>
</div>
<script>

    function printPage() {
        window.print();
    }
    // Function to hide the div
    function hideDiv() {
        document.getElementById('myDiv').style.display = 'none';
        document.getElementById('vaccinationSuccess').style.display = 'none';
    }

    // Set a timeout to call the hideDiv function after 5 seconds (5000 milliseconds)
    setTimeout(hideDiv, 8000);
</script>

<%
//            String receivedData = request.getParameter("username");
//            out.println("hey"+receivedData);
    String receivedData = URLDecoder.decode(request.getParameter("username"), "UTF-8");
    Connection connection = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;
    ArrayList<String> userData = new ArrayList<>();

    try {

        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaccinationDB", "root", "Root");

        String query1 = "SELECT * FROM doctor_user_vaccination_schedule WHERE username = ?";
        preparedStatement = connection.prepareStatement(query1);
        preparedStatement.setString(1, receivedData);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            userData.add(resultSet.getString(2));
            userData.add(resultSet.getString(3));
            userData.add(resultSet.getString(4));
            userData.add(resultSet.getString(5));
            userData.add(resultSet.getString(6));
            userData.add(resultSet.getString(7));
            userData.add(resultSet.getString(9));
            // Add more columns as needed
        }
        int numConfetti = 50; // Number of confetti elements to add
        for (int i = 0; i < numConfetti; i++) {
            out.println("<div class='confetti' style='left: " + (i * 2) + "vw;'></div>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>


<form action="mailsender.jsp">
    <input type="text" name="userName" value="<%= receivedData%>" style="display:none;">

    <div style="display:flex;">
        <p class="heading">Child Vaccination Report</p>
        <p class="printHeading">Child Vaccination Report</p>
        <button type="button" class="btn btn-primary no-print" style="width: 9%;
                position: relative;
                left: 41%;
                height: 40px;"
                onclick="window.location = 'dr_vaccination_to_users.jsp'">
            <i class="fa fa-backward" aria-hidden="true"></i>
            Back 
        </button>
        <button type="button" onclick="printPage()" class="btn btn-primary no-print" style="
                width: 9%;
                position: relative;
                left: 42%;
                height: 40px;">
            Print <i class="fa fa-print" aria-hidden="true"></i></button>
        <button type="submit" class="btn btn-primary no-print" style="
                width: 9%;
                position: relative;
                left: 42.8%;
                height: 40px;">
            Mail Reports <i class="fa fa-file" aria-hidden="true"></i>
        </button>
    </div>

    <table border="1" class="mb-3">
        <thead>
            <tr>
                <th>Parent Name</th>
                <th>Email Id</th>
                <th>Mobile No</th>
                <th>Child DOB</th>
                <th>Child Name</th>
                <th>Vaccination Date</th>
                <th>Vaccination Name</th>
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < userData.size(); i += 7) {
            %>
            <tr>
                <td><%= userData.get(i)%></td>
                <td><%= userData.get(i + 1)%></td>
                <td><%= userData.get(i + 2)%></td>
                <td><%= userData.get(i + 3)%></td>
                <td><%= userData.get(i + 4)%></td>
                <td><%= userData.get(i + 5)%></td>
                <td><%= userData.get(i + 6)%></td>
                <!-- Add more columns as needed -->
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</form>


