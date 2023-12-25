<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 17-Dec-2023
  Time: 12:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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
<div class="tin-container2 fw-bold">
    <h1 class="text-center fw-bold" >User Login</h1>
    <form action="/userLogin" method="post" >
        <label for="userNickName" class=" elements form-label text-white text-center" >Enter Your User Name : </label>
        <input type="text" name="userNickName" id="userNickName" class="form-control  elements">
        <label for="userPassword" class=" elements form-label text-white text-center">Enter Your Password : </label>
        <input type="text" name="userPassword" id="userPassword" class="form-control  elements">
        <button type="submit" class="btn btn-success">LoGiN</button>
    </form>
    <button onclick="window.location.href='index.jsp'" class="btn btn-danger">Go Back to Home</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>