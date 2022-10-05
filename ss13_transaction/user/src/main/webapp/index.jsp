<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 10/4/2022
  Time: 8:42 PM
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
<h1>List User</h1>
<a href="/user?action=createForm">Create new user</a>

<form action="/user">
  <input type="text" name="country" placeholder="Enter country">
  <button type="submit" name="action" value="findByCountry" >Search</button>
</form>
<form action="/user">
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
        <td><button><a href="/user?action=editForm&id=${per.getId()}">Edit</a></button></td>
<%--        <td><button><a href="/user?action=delete&id=${per.id}">Delete</a></button></td>--%>
        <td>
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Delete
          </button>

          <!-- Modal -->
          <div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
              <div class="modal-content bg-dark">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  Bạn có muốn xóa <strong class="text-danger">${per.name}</strong>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <a href="user?action=delete&id=${per.id}" class="btn btn-danger">Delete</a>
                </div>
              </div>
            </div>
          </div>
        </td>
      </tr>
    </c:forEach>

  </table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
