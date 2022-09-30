<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/30/2022
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View customer</title>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>Id: </td>
        <td>${product.getId()}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${product.getName()}</td>
    </tr>

    <tr>
        <td>Price: </td>
        <td>${product.getPrice()}</td>
    </tr>
        <td>Description: </td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Manufacture: </td>
        <td>${product.getManufacture()}</td>
    </tr>
</table>
</body>
</html>