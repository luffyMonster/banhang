<%--
  Created by IntelliJ IDEA.
  User: To Nghia
  Date: 4/15/2019
  Time: 2:39 AM
  To change this template use File | Settings | File Templates.
--%>
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
            <h2 class="form-title">Checkout
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
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="total" style="margin-top: 20px">
                        <div style="float: right; font-weight: bold">Total: $<c:out value="${sessionScope.myCartTotal}"/></div>
                        <div class="clear"></div>
                    </div>
                </c:if>
            </div>


            <div class="checkout-left">
                <c:if test="${sessionScope.myCartNum != null && sessionScope.myCartNum > 0}">
                <div class="col_1_of_login span_1_of_login">
                    <div class="login-title">
                        <h4 class="title">Add new details</h4>
                        <div class="comments-area">
                            <c:url value="/cart/checkout" var="checkOutUrl" />
                            <springForm:form method="POST" action="${checkOutUrl}" modelAttribute="checkOutBean" >
                                <p>
                                    <label>Full name</label>
                                    <span>*</span>
                                    <springForm:input path="fullName" type="text"  />
                                    <springForm:errors cssClass="error" path="fullName"/>
                                </p>
                                <p>
                                    <label>Phone number</label>
                                    <span>*</span>
                                    <springForm:input path="phoneNumber" type="text"  />
                                    <springForm:errors cssClass="error" path="phoneNumber"/>
                                </p>
                                <p>
                                    <label>Address </label>
                                    <span>*</span>
                                    <springForm:input path="address" type="text"  />
                                    <springForm:errors cssClass="error" path="address"/>
                                </p>
                                <p>
                                    <input style="float: left" type="submit" value="Next step: Payment method">
                                </p>
                            </springForm:form>
                        </div>
                    </div>
                </div>
                </c:if>
                <div class="col_1_of_login span_1_of_login">
                    <a href="<c:url value='/' />" class="btn btn1"><i class="zmdi zmdi-hc-1x zmdi-chevron-left"></i>  Continue shopping</a>
                </div>
                <div class="clear"></div>
            </div>

        </div>
    </div>
</div>

<%@include file="fragments/footer.jsp" %>
</body>
</html>
