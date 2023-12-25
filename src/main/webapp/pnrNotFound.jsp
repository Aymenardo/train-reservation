<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 23-Dec-2023
  Time: 02:24 pm
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
            color: #fdf0d5;
        }
    </style>
</head>
<body>
<div class="tin-container2">
    <h1 >Your Requested PNR Not Found!!!</h1>
    <form action="/searchPage.jsp">
        <button type="submit" class="btn btn-info" >Search Another Train</button>
    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
