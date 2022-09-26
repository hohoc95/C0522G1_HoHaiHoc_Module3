<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/26/2022
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--Tên sản phẩm--%>
<h3>Product Description: ${product_description}</h3>
<%--Giá--%>
<h3>List Price: ${price}</h3>
<%--Chiết khẩu--%>
<h3>Discount Amount: ${discount_amount}</h3>
<%--Giá sau khi chiết khẩu--%>
<h3>Discount Price: ${discount_price}</h3>
</body>
</html>