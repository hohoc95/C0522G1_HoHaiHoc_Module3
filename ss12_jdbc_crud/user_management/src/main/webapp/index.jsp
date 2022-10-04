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
  <title>$Title$</title>
</head>
<body>
<h1>Welcome</h1>

  <c:redirect url="/user"></c:redirect>
</body>
</html>

<%--<html>--%>
<%--<head>--%>
<%--  <title>$Title$</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<p>${msg}</p>--%>
<%--<a href="/user?action=showformcreate">Create new product</a>--%>
<%--<h1>List User</h1>--%>
<%--<table border="1">--%>
<%--  <tr>--%>
<%--    <th>STT</th>--%>
<%--    <th>Name</th>--%>
<%--    <th colspan="2">Action</th>--%>
<%--  </tr>--%>
<%--  <c:forEach var="per" items="${list}" varStatus="count">--%>
<%--    <tr>--%>
<%--      <td>${count.count}</td>--%>
<%--      <td>--%>
<%--        <c:out value="${per.getName()}"/>--%>
<%--      </td>--%>
<%--      <td><button><a href="">Edit</a></button></td>--%>
<%--      <td><button><a href="/user?action=delete&id=${per.id}">Delete</a></button></td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>

<%--</table>--%>
<%--</body>--%>
<%--</html>--%>