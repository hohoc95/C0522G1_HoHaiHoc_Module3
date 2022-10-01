<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/30/2022
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new product</title>
</head>
<body>
<h1>Create new product</h1>
<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/product">Back to prodcut list</a>
</p>
<form action="/product?action=create" method="post">

    <pre>ID:       <input type="text" name="id" required/></pre>
    <pre>Name:     <input type="text" name="name" required pattern="^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$"
                          oninvalid="this.setCustomValidity('Tên phải đúng quy tắc, vd: ')"> </pre>
    <pre>Price :  <input type="number" name="price" ></pre>
    <pre>Description: <input type="text" name="description"> </pre>
    <pre>Manufacture:    <input type="text" name="manufacture"> </pre>
    <pre>           <button>Save</button></pre>


<%--    <fieldset>--%>
<%--        <legend>Product Information</legend>--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>ID:</td>--%>
<%--                <td><input type="text" name="id" id="id"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Name:</td>--%>
<%--                <td><input type="text" name="name" id="name"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Price:</td>--%>
<%--                <td><input type="text" name="price" id="price"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Description:</td>--%>
<%--                <td><input type="text" name="description" id="description"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Manufacture:</td>--%>
<%--                <td><input type="text" name="manufacture" id="manufacture"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td><input type="submit" value="Create product"></td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </fieldset>--%>
</form>
</body>
</html>