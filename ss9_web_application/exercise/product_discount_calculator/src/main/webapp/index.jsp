<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/26/2022
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<head>
  <title>Product Discount Caculator</title>
<%--  <link rel="stylesheet" type="text/css" href="css/style.css">--%>
</head>
<body>
<h2>Discount Caculator</h2>
<form action="/caculator" method="post">
  <label>Product Description:</label>
  <input type="text" name="product_description"><br/>
  <label>List Price: </label>
  <input type="text" name="price"><br/>
  <label>Discount Percent: </label>
  <input type="text" name="discount_percent"><br/>
  <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>