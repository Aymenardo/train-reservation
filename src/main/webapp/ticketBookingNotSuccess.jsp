<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 23-Dec-2023
  Time: 08:11 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style-sheet.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        .custom-heading {
            color: #f30b0b;
        }
    </style>
</head>
<body>
    <h1 class="custom-heading container-fluid" >Ticket Not Booked. No Tickets available in the Current Class .Please try to Book the ticket in other CLasses </h1>
    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
        <form action="/searchPage.jsp">
            <button type="submit" class="btn btn-warning">Search Another Train</button>
        </form>
        <form action="/reserveAnotherTicket">
            <button type="submit" class="btn btn-success">Try to Reserve Other Classes tickets</button>
        </form>
        <form action="/logout">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>
</body>
</html>
