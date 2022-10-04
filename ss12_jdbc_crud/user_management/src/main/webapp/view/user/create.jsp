<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/4/2022
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button><a href="/user">Back</a></button>
<%--<form action="/user?action=create" method="post">--%>
<%--    <label for="name">Name:</label>--%>
<%--    <input type="text" id="name" name="name">--%>
<%--    <input type="submit" value="Create">--%>
<%--</form>--%>


<form action="/user?action=create" method="post">
    <fieldset>
        <legend>User Information</legend>
        <table>
            <tr>
                <td>ID:</td>
                <td><input type="text" name="id" id="id" required></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email" required></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country" id="country" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create user"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
