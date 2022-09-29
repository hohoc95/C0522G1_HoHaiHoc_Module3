<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 9/29/2022
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>Result:</h4>
<c:choose>
    <c:when test="${param.operator =='+'}">
        ${param.firstOperand} + ${param.secondOperand} = ${addition}
    </c:when>

    <c:when test="${param.operator =='-'}">
        ${param.firstOperand} - ${param.secondOperand} = ${subtraction}
    </c:when>

    <c:when test="${param.operator =='*'}">
        ${param.firstOperand} * ${param.secondOperand} = ${multiplication}
    </c:when>

    <c:when test="${param.operator == '/'}">
        <c:if test="${param.secondOperand == 0}">Can not divide by 0</c:if>

        <c:if test="${param.secondOperand != 0}">
            ${param.firstOperand} / ${param.secondOperand} = ${division}
        </c:if>
    </c:when>

</c:choose>
</body>
</html>