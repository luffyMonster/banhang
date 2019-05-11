<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Free Adidas Website </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <%@include file="fragments/common-header.jsp" %>
    <link rel="stylesheet" href="<c:url value='/css/form.css' />">
    <link href="<c:url value='/css/user.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="<c:url value='/fonts/material-icon/css/material-design-iconic-font.min.css' />">
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<div class="single">
    <div class="wrap">
        <div class="rsidebar span_1_of_left">
            <section class="sky-form">
                <h4>Category</h4>
                <div class="row row1 scroll-pane">
                    <ul class="list-nav">
                        <c:forEach var="item" items="${listCategory}" varStatus="loop">
                            <li>
                                <a href="<c:url value="/category/${item.categoryUrl}/${item.id}" /> ">${item.categoryName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </section>
        </div>
        <div class="cont span_2_of_3">
            <div class="mens-toolbar">
                <div class="sort">
                    ${navTitle}
                    ${category.categoryName}
                </div>
                <div class="pager">
                    <ul class="dc_pagination dc_paginationA dc_paginationA06">
                        <li>Pages</li>
                        <c:choose>
                            <c:when test="${isSearchPage}">
                                <c:forEach var="page" begin="1" end="${totalPage}">
                                    <li><a class="btn btn-default"
                                           href="<c:url value="/product/search?page=${page}&key=${keyword}" />"><c:out
                                            value="${page}"/></a></li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="page" begin="1" end="${totalPage}">
                                    <li><a class="btn btn-default"
                                           href="<c:url value="/category/${category.categoryUrl}/${category.id}/${page}" />"><c:out
                                            value="${page}"/></a></li>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <c:if test="${listProduct == null || listProduct.size() == 0}">
                <div class="box1" style="margin: 10px">Nothing to show.</div>
            </c:if>
            <c:forEach items="${listProduct}" var="prod" varStatus="loop">
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
        <div class="clear"/>
    </div>
</div>

<%@include file="fragments/footer.jsp" %>

</body>
</html>
