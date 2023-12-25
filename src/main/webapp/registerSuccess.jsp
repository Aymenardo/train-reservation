<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 23-Dec-2023
  Time: 06:26 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style-sheet.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
    </style>
    <style>
        .custom-heading {
            color: #2fff00;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="tin-container" >
    <h1 class="custom-heading">Your Registration Is success .Now You can log in With your Credentials</h1>
    <button onclick="window.location.href='index.jsp'" class="btn btn-danger">Go Back to Home</button>
</div>
</body>
</html>
