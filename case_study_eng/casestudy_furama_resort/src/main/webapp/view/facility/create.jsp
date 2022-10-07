<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/6/2022
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Create Facility</title>
  <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
<button><a href="/user">Back to home</a></button>
<form action="/user?action=create" method="post">

  <label ><input type="text" name="facilityName" required>Facility Name</label><br>
  <label ><input type="text" name="facilityArea" required>Area</label><br>
  <label ><input type="text" name="facilityCost" required>Facility Cost</label><br>
  <label ><input type="text" name="maxPeople" required></label>Max People<br>
  <label ><input type="text" name="standardRoom" required></label>Standard Room<br>
  <label ><input type="text" name="descriptionOtherConvenience" required>Description Other Convenience</label><br>
  <label ><input type="text" name="poolArea" required>Pool Area</label><br>
  <label ><input type="text" name="numberOfFloors" required>Number Of Floors</label><br>
  <label ><input type="text" name="facilityFree" required>Facility Free</label><br>
  <label ><input type="text" name="rentTypeId" required>Rent TypeId</label><br>
  <label ><input type="text" name="facilityTypeId" required>Facility TypeId</label><br>

  <input type="submit" value="Submit">

</form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</html>