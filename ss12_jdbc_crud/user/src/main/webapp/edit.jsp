<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/4/2022
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<h1>Edit user</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/user">Back to user list</a>
</p>
<form action="/user?action=edit&id=${user.id}" method="post">
    <fieldset>
        <legend>User information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email" value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country" id="country" value="${user.getCountry()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update user"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>