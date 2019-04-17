<%--
  Created by IntelliJ IDEA.
  User: To Nghia
  Date: 4/3/2019
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Free Adidas Website</title>
    <%@include file="fragments/common-header.jsp"%>
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<%@include file="fragments/banner-home.jsp" %>
<div class="main">
    <div class="wrap">
        <div class="content-top">
        </div>
        <div class="content-bottom">
            <c:forEach items="${products}" var="prod" varStatus="loop">
                <c:if test="${loop.index % 3 == 0}">
                    <div class="box1">
                </c:if>
                <%@include file="fragments/product.jsp" %>
                <c:if test="${loop.index % 3 == 2 || loop.last}">
                    <div class="clear"></div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<%@include file="fragments/footer.jsp" %>
</body>
</html>
