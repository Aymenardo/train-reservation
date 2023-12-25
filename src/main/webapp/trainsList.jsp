<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 17-Dec-2023
  Time: 06:28 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>TrainList</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        .custom-heading {
            color: #000000; /* You can change the color to your preferred color */
        }
    </style>
</head>
<body>
<h2 class="custom-heading fw-bold text-center ">Search Train</h2>
<jsp:useBean id="trainList" scope="request" type="java.util.List"/>
<table class="table table-success table-striped">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Source Station</th>
        <th scope="col">Destination Station</th>
        <th scope="col">DepartureTime</th>
        <th scope="col">ArrivalTime</th>
        <th scope="col">DepartureDate</th>
        <th scope="col">ArrivalDate</th>
        <th scope="col">trainType</th>
        <th scope="col">AverageSpeed</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="train" items="${trainList}">
        <tr>
            <th scope="row">${train.trainId}</th>
            <td>${train.trainName}</td>
            <td>${train.trainSourceStation}</td>
            <td>${train.trainDestinationStation}</td>
            <td>${train.trainDepartureTime}</td>
            <td>${train.trainArrivalTime}</td>
            <td>${train.trainDepartureDate}</td>
            <td>${train.trainArrivalDate}</td>
            <td>${train.trainType}</td>
            <td>${train.trainAverageSpeed}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<form action="/trainEnquiry" onsubmit="return validateForm()" >
    <label for="trainId" class=" elements form-label text-white text-center">Select Train To Proceed :</label>
    <select id="trainId" name="trainId" class="form-control  elements" >
        <option value="" class="text-center"> Click here to Select</option>
        <c:forEach var="train" items="${trainList}">
            <option value="${train.trainId}">${train.trainName}</option>
        </c:forEach>
    </select>
    <button type="submit" class="btn btn-success elements">Enquire Train</button>
</form>
<script>
    function validateForm(){
        let selectedOption = document.getElementById("trainSourceStation") ;
        if(selectedOption.trim() === "") {
            alert("Please Select a Train Before Submitting the Form") ;
            return false ;
        }
        return true ;
    }
</script>
<button onclick="window.location.href='index.jsp'" class="btn btn-danger">Go Back to Home</button>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>