<%--
  Created by IntelliJ IDEA.
  User: Kasun
  Date: 2/19/2016
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>


  <button type="submit" data-ng-click="showLog()"class="btn btn-blue"> show</button>
  <c:if test="${not empty lists}">

    <ul>
      <c:forEach var="listValue" items="${lists}">
        <li>${listValue}</li>
      </c:forEach>
    </ul>

  </c:if>
</head>
<body>

</body>
</html>
