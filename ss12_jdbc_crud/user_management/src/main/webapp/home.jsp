<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/3/2022
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<p>${msg}</p>
<a href="/user?action=showformcreate">Create new product</a>
<h1>List User</h1>
<table class="table table-striped" border="1">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach var="per" items="${list}" varStatus="count">
        <tr>
            <td>${count.count}</td>
            <td>
                <c:out value="${per.getName()}"/>
            </td>
            <td>
                <c:out value="${per.getEmail()}"/>
            </td>
            <td>
                <c:out value="${per.getCountry()}"/>
            </td>
<%--            <td><button><a href="">Edit</a></button></td>--%>
            <td><a href="/edit?action=edit&id=${edit.getId()}">edit</a></td>
            <td><button><a href="/user?action=delete&id=${per.id}">Delete</a></button></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
