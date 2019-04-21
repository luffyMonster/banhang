<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Free Adidas Website</title>
    <%@include file="fragments/common-header.jsp"%>
</head>
<body>
<div class="main">
    <div class="wrap">
        <h1 class="form-title" style="font-weight: bold; margin-top: 20px">An error has occur.</h1>
        <c:if test="${errorMessage != null}" >
            <p>${errorMessage}</p>
        </c:if>
        <c:if test="${errorMessage == null}" >
            <p>404 - Page does not exist</p>
        </c:if>

        <a class="add-to-links" href="<c:url value='/' /> " style="margin-bottom: 20px; text-decoration: underline; color: blue;">Back to Home Page</a>
    </div>
</div>
</body>
</html>