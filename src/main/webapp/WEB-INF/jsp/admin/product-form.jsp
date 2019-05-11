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
                    <c:if test="${successMessage != null}">
                        <div class="alert alert-success">
                                ${successMessage}
                        </div>
                    </c:if>
                    <c:if test="${errorMessage != null}">
                        <div class="alert alert-danger">
                                ${errorMessage}
                        </div>
                    </c:if>
                    <div class="col-md-12 compose-right">
                        <div class="inbox-details-default">
                            <div class="inbox-details-heading">
                                ${product.name}
                            </div>
                            <div class="inbox-details-body">
                                <c:url value="/admin/product/save" var="saveUrl"/>
                                <form:form method="POST" modelAttribute="product" action="${saveUrl}"
                                           cssClass="com-mail" enctype="multipart/form-data">
                                    <form:hidden path="id"/>
                                    <div class="form-group">
                                        <label>Category*</label>
                                        <form:select path="category.id">
                                            <option value="-1">Select a type</option>
                                            <c:forEach var="c" items="${listCategory}">
                                                <option value="${c.id}" ${product.category.id == c.id ? 'selected=""' : ''}>${c.categoryName}</option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="category" cssClass="error"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Name *</label>
                                        <form:input path="name"/>
                                        <form:errors path="name" cssClass="error"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Price*</label>
                                        <form:input path="price" />
                                        <form:errors path="price" cssClass="error"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <form:textarea path="description"/>
                                        <form:errors path="description" cssClass="error"/>
                                    </div>
                                    <div class="form-group">
                                        <div class="btn btn-default btn-file">
                                            <i class="fa fa-paperclip"> </i> Attachment
                                            <input type="file" name="attachment" id="chooser">
                                            <form:hidden path="imageUrl"/>
                                        </div>

                                        <img src="<c:url value="${product.imageUrl}" /> " id="imgPreview" alt="" height="40"/>
                                        <form:errors path="imageUrl" cssClass="error"/>
                                        <script>
                                            function readURL(input) {
                                                if (input.files && input.files[0]) {
                                                    var reader = new FileReader();
                                                    reader.onload = function(e) {
                                                        $('#imgPreview').attr('src', e.target.result);
                                                    };
                                                    reader.readAsDataURL(input.files[0]);
                                                }
                                            }

                                            $("#chooser").change(function() {
                                                console.log("x");
                                                readURL(this);
                                            });
                                        </script>
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
