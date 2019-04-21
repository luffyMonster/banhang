<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Category manager</title>
</head>
<body>

<div class="page-container">

    <div class="left-content">

        <div class="mother-grid-inner">

            <jsp:include page="header.jsp" />

            <div class="inner-block">
                <div class="inbox">
                    <h2>Product Manage</h2>
                    <div class="col-md-12 mailbox-content  tab-content tab-content-in">
                        <div class="tab-pane active text-style" id="tab1">
                            <div class="mailbox-border">
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
                                <div class="mail-toolbar clearfix">
                                    <div class="float-right">
                                        <span class="text-muted m-r-sm">Pages </span>
                                        <div class="btn-group">
                                            <a class="btn btn-default"><i class="fa fa-angle-left"></i></a>
                                            <c:forEach var="page" begin="1" end="${totalPage}">
                                                <a class="btn btn-default" href="<c:url value="/admin/order/list/${page}" />"><c:out value="${page}"/></a>
                                            </c:forEach>
                                            <a class="btn btn-default"><i class="fa fa-angle-right"></i></a>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <table class="table tab-border">
                                    <tbody>
                                    <tr>
                                        <td class="hidden-xs">
                                            <b>Receipt Name</b>
                                        </td>
                                        <td class="hidden-xs" style="width: 200px;">
                                            <b>Receipt phone number</b>
                                        </td>
                                        <td style="text-align: right; width: 150px;">
                                            <b>Receipt address</b>
                                        </td>
                                        <td style="text-align: right; width: 150px;">
                                            <b>Receipt date</b>
                                        </td>
                                        <td style="text-align: right; width: 150px;">
                                            <b>Order status</b>
                                        </td>
                                        <td style="text-align: right; width: 150px;">
                                            <b>Option</b>
                                        </td>
                                    </tr>
                                    <c:forEach var="item" items="${listReceipt}">
                                        <tr class="unread checked">
                                            <td class="hidden-xs">
                                                    ${item.receiptName}
                                            </td>
                                            <td class="hidden-xs" style="width: 200px;">
                                                    ${item.phoneNumber}
                                            </td>
                                            <td class="hidden-xs" style="width: 200px;">
                                                    ${item.receiptAddress}
                                            </td>
                                            <td style="text-align: right; width: 150px;">
                                                <fmt:formatDate type = "both"
                                                                dateStyle = "short" timeStyle = "short" value = "${item.receiptDate}" />
                                            </td>
                                            <td class="hidden-xs" style="width: 200px;">
                                                    ${item.receiptStatus?"Confirmed":"Waiting"}
                                            </td>

                                            <td style="text-align: center; width: 150px;">
                                                <a class="btn btn-default" href="<c:url value="/admin/order/items/${item.id}" /> ">View Items</a>
                                                <c:if test="${!item.receiptStatus}">
                                                <a class="btn btn-default" href="<c:url value="/admin/order/confirm/${item.id}?page=${actualPage}" /> ">Confirm Order</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>

            <jsp:include page="footer.jsp" />

        </div>

    </div>

    <jsp:include page="navigation.jsp" />

</div>

</body>
</html>
