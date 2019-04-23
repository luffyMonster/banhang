<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order details</title>
</head>
<body>

<div class="page-container">

    <div class="left-content">

        <div class="mother-grid-inner">

            <jsp:include page="header.jsp"/>

            <div class="inner-block">
                <div class="inbox">
                    <h2>Order details</h2>
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

                    <div class="col-md-12 mailbox-content  tab-content tab-content-in">
                        <div class="tab-pane active text-style" id="tab1">
                            <div class="mailbox-border">
                                <div class="mail-toolbar clearfix">
                                    <c:if test="${receipt.receiptStatus}">
                                        <div class="float-left" style="margin-bottom: 20px">
                                            <a href="<c:url value="/admin/order/confirm/${receipt.id}" /> "
                                               class="btn btn-default"><strong>Confirm</strong></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </c:if>
                                    <div class="container">
                                        <div class="row">
                                            <span style="display: inline-block;width: 200px; margin-right: 10px; font-weight: bold"><strong>Receipt Name</strong></span>
                                            <span>${receipt.receiptName}</span>
                                        </div>
                                        <div class="row">
                                            <span style="display: inline-block;width: 200px; margin-right: 10px; font-weight: bold">Receipt Phone</span>
                                            <span>${receipt.phoneNumber}</span>
                                        </div>
                                        <div class="row">
                                            <span style="display: inline-block;width: 200px; margin-right: 10px; font-weight: bold">Receipt date</span>
                                            <span><fmt:formatDate type="both"
                                                                  dateStyle="short" timeStyle="short"
                                                                  value="${receipt.receiptDate}"/></span>
                                        </div>
                                        <div class="row">
                                            <span style="display: inline-block;width: 200px; margin-right: 10px; font-weight: bold">Status</span>
                                            <span class="col">${receipt.receiptStatus?"Confirmed":"Waiting"}</span>
                                        </div>
                                    </div>
                                </div>
                                <table class="table tab-border">
                                    <tbody>
                                    <tr>
                                        <td class="hidden-xs">
                                            <b>Product</b>
                                        </td>
                                        <td class="hidden-xs" style="width: 200px;">
                                            <b>Image</b>
                                        </td>
                                        <td style="text-align: center; width: 200px;">
                                            <b>Item Price</b>
                                        </td>
                                        <td style="text-align: center; width: 200px;">
                                            <b>Item quantity</b>
                                        </td>
                                    </tr>
                                    <c:forEach var="item" items="${receipt.listReceiptItem}">
                                        <tr class="unread checked">
                                            <td class="hidden-xs">
                                                    ${item.product.name}
                                            </td>
                                            <td class="hidden-xs" style="width: 200px">
                                                <img src="<c:url value="${item.product.imageUrl}" />" width="40"/>
                                            </td>
                                            <td align="center" style="text-align: center; width: 200px;">
                                                $${item.receiptItemPrice}
                                            </td>
                                            <td style="text-align: center; width: 200px;">
                                                    ${item.receiptItemQuantity}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
