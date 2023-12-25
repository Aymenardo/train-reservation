<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 23-Dec-2023
  Time: 02:53 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cancellation Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style-sheet.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
    </style>
    <style>
        .custom-heading {
            color: #2fff00; /* You can change the color to your preferred color */
        }
    </style>
</head>
<body>
<div class="tin-container">
    <h4 class="text-info"><%= request.getAttribute("cancellationProcessResultMessage")%></h4>

    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
        <form action="/searchPage.jsp">
            <button type="submit" class="btn btn-success">Go To Main Page</button>
        </form>
        <form action="/logout">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>
</html>
