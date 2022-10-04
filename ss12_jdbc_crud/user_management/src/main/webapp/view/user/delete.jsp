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
<p>Bạn có muốn xóa : <span><c:out value="${user.name}"/></span></p>
<button><a href="/user?action=deleteUser&id=${user.id}">Có</a></button>
<button><a href="/user">Không</a></button>
</body>
</html>
