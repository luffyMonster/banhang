<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Manager</title>
</head>
<body>

<div class="page-container">

    <div class="left-content">

        <div class="mother-grid-inner">

            <jsp:include page="header.jsp"/>

            <div class="inner-block">
                <div class="inbox">
                    <h2>Product Details</h2>
                    <div class="col-md-12 compose-right">
                        <div class="inbox-details-default">
                            <div class="inbox-details-heading">
                                ${product.name}
                            </div>
                            <div class="inbox-details-body">
                                <c:if test="${successMessage != null}">
                                    <div class="alert alert-info">
                                            ${successMessage}
                                    </div>
                                </c:if>
                                <c:if test="${errorMessage != null}">
                                    <div class="alert alert-danger">
                                            ${errorMessage}
                                    </div>
                                </c:if>
                                <c:url value="/admin/product/save" var="saveUrl"/>
                                <form:form method="POST" modelAttribute="product" action="${saveUrl}"
                                           cssClass="com-mail">
                                    <label>Category</label>
                                    <form:select path="category.id">
                                        <option value="-1">Select a type</option>
                                        <c:forEach var="c" items="${listCategory}">
                                            <option value="${c.id}" ${product.category.id == c.id ? 'selected=""' : ''}>${c.categoryName}</option>
                                        </c:forEach>
                                    </form:select><br/>
                                    <label>Name</label>
                                    <form:input path="name"/>
                                    <label>Price</label>
                                    <form:input path="price"/>
                                    <%--<label>Sale</label>--%>
                                    <%--<form:input path="productSale" />--%>
                                    <label>Description</label>
                                    <form:textarea path="description"/>
                                    <div class="form-group">
                                        <div class="btn btn-default btn-file">
                                            <i class="fa fa-paperclip"> </i> Attachment
                                            <input type="file" name="attachment">
                                        </div>
                                    </div>
                                    <input type="submit" value="Save">
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>

            <jsp:include page="footer.jsp"/>

        </div>

    </div>

    <jsp:include page="navigation.jsp"/>

</div>

</body>
</html>
