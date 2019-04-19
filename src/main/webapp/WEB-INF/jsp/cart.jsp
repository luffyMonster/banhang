<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="springForm" %>
<html>
<head>
    <title>Free Adidas Website</title>
    <%@include file="fragments/common-header.jsp" %>
    <link rel="stylesheet" href="<c:url value='/fonts/material-icon/css/material-design-iconic-font.min.css' />">
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<div class="main">
    <div class="login">
        <div class="wrap">
            <h2 class="form-title">Shopping cart
                <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
            </h2>

            <!-- //tittle heading -->
            <div class="checkout-right">
                <c:if test="${sessionScope.myCartNum == null || sessionScope.myCartNum == 0}">
                    <h4 class="title">Shopping cart is empty</h4>
                    <p class="cart">You have no items in your shopping cart.<br>Click<a href="<c:url value='/' /> ">
                        here</a> to continue shopping</p>
                </c:if>
                <c:if test="${sessionScope.myCartNum != null && sessionScope.myCartNum > 0}">
                    <h3>Your shopping cart contains:
                        <span>${sessionScope.myCartNum} Products</span>
                    </h3>
                    <div class="table-responsive">
                        <table class="timetable_sub">
                            <thead>
                            <tr>
                                <th>SL No.</th>
                                <th>Product</th>
                                <th>Quality</th>
                                <th>Product Name</th>

                                <th>Price</th>
                                <th>Remove</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sessionScope.myCartItems}" var="entry" varStatus="loop">
                                <tr class="rem${loop.index}">
                                    <td class="invert">1</td>
                                    <td class="invert-image">
                                        <a href="<c:url value='/product/${entry.value.product.id}' />">
                                            <img src="<c:url value='${entry.value.product.imageUrl}' />" alt=" " class="img-responsive">
                                        </a>
                                    </td>
                                    <td class="invert">
                                        <div class="quantity">
                                                ${entry.value.quantity}
                                        </div>
                                    </td>
                                    <td class="invert">${entry.value.product.name}</td>
                                    <td class="invert">${entry.value.product.price*entry.value.quantity}</td>
                                    <td class="invert">
                                        <div class="rem">
                                            <a href="<c:url value='/cart/remove/${entry.value.product.id}' /> ">
                                                <i class="zmdi zmdi-hc-2x zmdi-close"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="total" style="margin-top: 20px">
                        <div style="float: right">Total: $<c:out value="${sessionScope.myCartTotal}"/></div>
                        <div class="clear"></div>
                    </div>
                </c:if>
            </div>
            <div class="checkout-left">
                <div class="col_1_of_login span_1_of_login">
                    <a href="<c:url value='/cart/checkout' />" class="btn btn1" STYLE="float: left"> Checkout</a>
                </div>
                <div class="col_1_of_login span_1_of_login">
                    <a href="<c:url value='/' />" class="btn btn1" style="margin-right: 0"><i class="zmdi zmdi-hc-1x zmdi-chevron-left"></i>
                        Continue shopping</a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

<%@include file="fragments/footer.jsp" %>
</body>

</html>
