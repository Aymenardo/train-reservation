<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 21-Dec-2023
  Time: 07:33 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


  <style>
    body  {
margin-left: 20%;
      margin-right: 20%;
      background: linear-gradient(rgba(10, 83, 190, 0.8), rgba(10, 83, 190, 0.8));
    }
    .sub-div{
      margin-left: 20%;
      margin-right: 20%;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      row-gap: 5px;
    }
    .sub-div2{
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      row-gap: 5px;
    }
  </style>

</head>
<body class="align-content-center justify-content-center">
<h1 class="text-dark text-center">Class And Preferred Berth</h1>
<%--<div class="tin-container">--%>
  <jsp:useBean id="chosenTrainEnquiryList" scope="request" type="java.util.List"/>
  <c:forEach var="SeatTypeInfo" items="${chosenTrainEnquiryList}">
      <h3 class="text-dark">${SeatTypeInfo.seatClassType}</h3>
      <table class="table table-success table-striped">
        <thead>
        <tr>
          <th scope="col">Type</th>
          <th scope="col">Available</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <th scope="row">Upper Berth</th>
          <td>${SeatTypeInfo.seatUpperBerthAvailable}</td>
        </tr>
        <tr>
          <th scope="row">Middle Berth</th>
          <td>${SeatTypeInfo.seatMiddleBerthAvailable}</td>
        </tr>
        <tr>
          <th scope="row">Lower Berth</th>
          <td>${SeatTypeInfo.seatLowerBerthAvailable}</td>
        </tr>
        <tr>
          <th scope="row">RAC</th>
          <td>${SeatTypeInfo.seatRacAvailable}</td>
        </tr>
        <tr>
          <th scope="row">Waiting List</th>
          <td>${SeatTypeInfo.seatWaitingListAvailable}</td>
        </tr>
        </tbody>
      </table>
  </c:forEach>

 <div class="sub-div">
   <form action="/reserveTicket" class="sub-div2">
     <label for="ChosenClass" class=" form-label text-white text-center">Choose the Desired Class :</label>
     <select name="ChosenClass" id="ChosenClass"  class="form-control">
       <option value="1AC" >1AC</option>
       <option value="2AC" >2AC</option>
       <option value="3AC">3AC</option>
       <option value="SL" >SL</option>
       <option value="General" >General</option>
     </select>
     <label for="ChosenBerth" class=" form-label text-white text-center">Choose the Preferred Berth : </label>
     <select name="ChosenBerth" id="ChosenBerth"  class="form-control  ">
       <option value="UpperBerth" >Upper Berth</option>
       <option value="MiddleBerth" >Middle Berth</option>
       <option value="LowerBerth" >Lower Berth</option>
     </select>
     <button type="submit" class="btn btn-success">Book Ticket</button>
   </form>
   <form action="/searchPage.jsp">
     <button type="submit" class="btn btn-info" >Search Another Train</button>
   </form>
   <button onclick="window.location.href='index.jsp'" class="btn btn-danger">Go Back to Home</button>
 </div>
<%--</div>--%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
