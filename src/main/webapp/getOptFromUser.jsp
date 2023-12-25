<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 23-Dec-2023
  Time: 06:11 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Otp Verification</title>
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
<%
String errorMessage = (String)request.getAttribute("errorMessage");
if(errorMessage != null) {
%>
<h3 class="text-danger-emphasis">Wrong OTP...Please Enter The Correct OPT.....</h3>
<%
    }
%>
<div class="tin-container2 fw-bold">
    <h1 class="text-center fw-bold" >OPT VERIFICATION</h1>
    <h5 class="text-center fw-bold">Kindly Check Your Email.....</h5>
    <form action="/registerPart2" >
        <label for="optGotFromUser" class=" elements form-label text-white text-center">Enter the OTP you got in your mail : </label>
        <input type="text" name="optGotFromUser" id="optGotFromUser" class="form-control  elements">
        <button type="submit" class="btn btn-success">Verify the OPT</button>
    </form>

    <button onclick="window.location.href='index.jsp'" class="btn btn-danger">Go Back to Home</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>


</body>
</html>
