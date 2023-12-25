<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 23-Dec-2023
  Time: 07:38 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="styles/style-sheet.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        .custom-heading {
            color: #fdf0d5;
        }
    </style>
</head>
<body>
<jsp:useBean id="ticket" scope="request" type="com.hibernate.entity.Ticket"/>
<h1 class="custom-heading">TICKET BOOKING IS SUCCESSFUL</h1>
<%
if(ticket.getTicketReservedBerth().equals("WaitingList")){
%>
<h2 style="color: red">Sorry Your Ticket is Not Confirmed. Your ticket is in the waiting list. We will let you know through the Email when your Ticket is approved</h2>
<%
    }%>
<table class="table table-bordered border-primary">
    <thead>
    <tr>
        <th scope="col" >PNR</th>
        <th scope="col" >Train Name</th>
        <th scope="col" >Source Station</th>
        <th scope="col" >Destination Station</th>
        <th scope="col" >Departure Date</th>
        <th scope="col" >Departure Time</th>
        <th scope="col" >Class Type</th>
        <th scope="col" >Booked Berth</th>
        <th scope="col" >Ticket Cost</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row"><c:out value="${ticket.ticketPnrId}" /></th>
        <td><c:out value="${ticket.train.trainName}" /></td>
        <td><c:out value="${ticket.train.trainSourceStation}" /></td>
        <td><c:out value="${ticket.train.trainDestinationStation}" /></td>
        <td><c:out value="${ticket.train.trainDepartureDate}" /></td>
        <td><c:out value="${ticket.train.trainDepartureTime}" /></td>
        <td><c:out value="${ticket.seat.seatClassType}" /></td>
        <td><c:out value="${ticket.ticketReservedBerth}" /></td>
        <td><c:out value="${ticket.ticketFair}" /></td>

    </tr>
    </tbody>
</table>

<div class="btn-group" role="group" aria-label="Basic mixed styles example">
    <form action="/searchPage.jsp">
        <button type="submit" class="btn btn-info">Search Another Train</button>
    </form>
    <form action="/reserveAnotherTicket">
        <button type="submit" class="btn btn-success">Reserve Another ticket</button>
    </form>
    <form action="/logout">
        <button type="submit" class="btn btn-danger">Logout</button>
    </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
