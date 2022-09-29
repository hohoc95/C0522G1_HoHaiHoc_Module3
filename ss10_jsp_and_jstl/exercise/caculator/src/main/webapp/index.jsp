<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/29/2022
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<h1> Simple Calculator</h1>
<form action="/CalculatorServlet" method="get">
  <fieldset>
    <legend>Calculator</legend>

    <table>
      <tr>
        <td><label>First operand: </label></td>
        <td><input name="firstOperand" placeholder="input"><br></td>
      </tr>
      <tr>
        <td><label>Operator</label></td>
        <td><select name="operator">
          <option value="+">Addition</option>
          <option value="-">Subtraction</option>
          <option value="*">Multiplication</option>
          <option value="/">Division</option>
        </select><br>
        </td>
      </tr>
      <tr>
        <td><label>Second Operator: </label></td>
        <td><input name="secondOperand" placeholder="input"><br></td>
      </tr>
      <tr>
        <td></td>
        <td>
          <button type="submit">Result</button>
        </td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>