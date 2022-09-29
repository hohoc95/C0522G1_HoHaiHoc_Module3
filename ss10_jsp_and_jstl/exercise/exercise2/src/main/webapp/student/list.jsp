<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/29/2022
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Trang danh sách sinh viên</h1>
<table class="table table-striped">
    <tr>
        <th>Name</th>
        <th>Date</th>
        <th>Address</th>
        <th>Picture</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.date}"/></td>
            <td><c:out value="${student.address}"/></td>
            <img  src="${student.picture()}" alt="">
            <td><button class="btn btn-primary btn-sm">Edit</button></td>
            <td><button class="btn btn-danger btn-sm">Delete</button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

