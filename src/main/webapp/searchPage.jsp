<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 17-Dec-2023
  Time: 06:29 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Train Search</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style-sheet.css">

    <style>
        <%@include file="./styles/style-sheet.css" %>
    </style>
    <style>
        .custom-heading {
            color: #000000; /* You can change the color to your preferred color */
        }
    </style>
</head>
<body>

<div class="tin-container2">
    <h2 class="custom-heading fw-bold text-center ">Search Train</h2>
    <!-- <h2 class="text-primary">Search Train</h2> -->
    <form action="/showTrain">


        <label for="trainSourceStation" class=" elements form-label text-white text-uppercase">Select Source Station:</label>
        <select id="trainSourceStation" name="trainSourceStation" class="form-control  elements">

            <option value="casablanca">casablanca</option>
            <option value="rabat">rabat</option>
            <option value="merrakch">merrakch</option>
            <option value="mohammedia">mohammedia</option>
            <option value="safi">safi</option>
            <option value="agadir">agadir</option>
            <option value="tetouan">tetouan</option>
            <option value="tngier">tngier</option>
            <option value="fes">fes</option>
            <option value="meknes">meknes</option>
            <option value="al jadida">al jadida</option>
            <option value="tata">tata</option>
            <option value="ben gguerir">ben gguerir</option>

        </select>

        <br>

        <label for="trainDestinationStation" class=" elements form-label text-white text-uppercase">Select Destination Station:</label>
        <select id="trainDestinationStation" name="trainDestinationStation" class="form-control  elements">
            <!-- List of destination stations -->
            <option value="Chennai">Chennai</option>
            <option value="Mumbai">Mumbai</option>
            <option value="Hyderabad">Hyderabad</option>
            <option value="Pune">Pune</option>
            <option value="Jaipur">Jaipur</option>
            <option value="Chennai Egmore">Chennai Egmore</option>
            <option value="Chennai Central">Chennai Central</option>
            <option value="Bengaluru">Bengaluru</option>
        </select>
        <label for="trainDepartureTime" class=" elements form-label text-white text-uppercase">Choose Your Departure Time : </label>
        <input type="date" id="trainDepartureTime" name="trainDepartureTime" class="form-control  elements">
        <button type="submit" class="btn btn-success elements">show trains</button>
    </form>

    <h2 class="custom-heading fw-bold ">Enquire Ticket Status</h2>

    <form action="/enquireTicketPnrStatus">
        <label for="ticketPnrStatus" class=" elements form-label text-white text-uppercase">Enter Your PNR Number : </label>

        <input type="text" name="ticketPnrStatus" id="ticketPnrStatus" class="form-control  elements">
        <button type="submit" class="btn btn-success elements">Get Status</button>
    </form>
    <button onclick="window.location.href='index.jsp'" class="btn btn-danger" >Go Back to Home</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>