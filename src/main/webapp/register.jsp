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
    <title>register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style-sheet.css">

    <style>
        <%@include file="./styles/style-sheet.css" %>
    </style>
</head>
<body>
<div class="tin-container2 fw-bold">
    <h1 class="text-center fw-bold"  >User Registration</h1>
    <form action="/userRegister" method="post" >
        <label for="userName" class=" elements form-label text-white text-center">Enter Your Full Name : </label>
        <input type="text" id="userName" name="userName" class="form-control  elements" required >
        <label for="userNickName" class=" elements form-label text-white text-center">Enter a new username(used while login): </label>
        <input type="text" id="userNickName" name="userNickName" class="form-control  elements" required>
        <label for="userPassword" class=" elements form-label text-white text-center"> Enter a New User Password : </label>
        <input type="password" id="userPassword" name="userPassword" class="form-control  elements" required>
        <label for="userMobileNumber" class=" elements form-label text-white text-center">Enter Your Mobile Number : </label>
        <input type="text" id="userMobileNumber" name="userMobileNumber" class="form-control  elements" required>
        <label for="userEmailId" class=" elements form-label text-white text-center">Enter Your Email Id : </label>
        <input type="text" id="userEmailId" name="userEmailId" class="form-control  elements" required>
        <button type="submit" class="btn btn-success elements p-2">Register and Login</button>
    </form>
    <button type="button" class="btn btn-danger p-2" onclick="window.location.href='index.jsp'">Go Back To Home</button>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>