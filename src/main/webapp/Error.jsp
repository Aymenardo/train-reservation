<%--
  Created by IntelliJ IDEA.
  User: tines
  Date: 17-Dec-2023
  Time: 04:11 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h1>Error</h1>
    <h2><%= request.getAttribute("errorMessage") %></h2>

    <button onclick="window.location.href='index.jsp'">Go Back to Home</button>

</body>
</html>