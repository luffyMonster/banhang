<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Category Manager</title>
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
                                ${category.name}
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
                                <c:url value="/admin/category/save" var="saveUrl"/>
                                <form:form method="POST" modelAttribute="category" action="${saveUrl}"
                                           cssClass="com-mail">
                                    <label>Name</label>
                                    <form:input path="categoryName"/>
                                    <label>Category URL</label>
                                    <form:input path="categoryUrl"/>
                                    <label>Category Status</label>
                                    ${category.categoryStatus?"ACTIVE":"NON-ACTIVE"}
                                    <form:hidden path="categoryStatus" />
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
