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
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
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
                <h3>Your shopping cart contains:
                    <span>3 Products</span>
                </h3>
                <div class="table-responsive">
                    <form action="/checkout" method="post">
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
                            <tr class="rem1">
                                <td class="invert">1</td>
                                <td class="invert-image">
                                    <a href="single2.html">
                                        <img src="images/pic1.jpg" alt=" " class="img-responsive">
                                    </a>
                                </td>
                                <td class="invert">
                                    <div class="quantity">
                                        <input name="qty1" type="number" value="1" min="1" style="max-width: 45px"/>
                                    </div>
                                </td>
                                <td class="invert">Spotzero Spin Mop</td>
                                <td class="invert">$888.00</td>
                                <td class="invert">
                                    <div class="rem">
                                        <i class="zmdi zmdi-hc-3x zmdi-close"></i>
                                    </div>
                                </td>
                            </tr>
                            <tr class="rem2">
                                <td class="invert">2</td>
                                <td class="invert-image">
                                    <a href="single2.html">
                                        <img src="images/pic2.jpg" alt=" " class="img-responsive">
                                    </a>
                                </td>
                                <td class="invert">
                                    <div class="quantity">
                                        <input name="qty1" type="number" value="1" style="max-width: 45px"/>
                                    </div>
                                </td>
                                <td class="invert">Fair & Lovely, 80 g</td>
                                <td class="invert">$121.60</td>
                                <td class="invert">
                                    <div class="rem">
                                        <i class="zmdi zmdi-hc-3x zmdi-close"></i>
                                    </div>
                                </td>
                            </tr>
                            <tr class="rem3">
                                <td class="invert">3</td>
                                <td class="invert-image">
                                    <a href="single.html">
                                        <img src="images/pic3.jpg" alt=" " class="img-responsive">
                                    </a>
                                </td>
                                <td class="invert">
                                    <div class="quantity">
                                        <input name="qty1" type="number" value="1" style="max-width: 45px"/>
                                    </div>
                                </td>
                                <td class="invert">Sprite, 2.25L (Pack of 2)</td>
                                <td class="invert">$180.00</td>
                                <td class="invert">
                                    <div class="rem">
                                        <i class="zmdi zmdi-hc-3x zmdi-close"></i>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>

            <div class="checkout-left">
                <div class="col_1_of_login span_1_of_login">
                    <div class="login-title">
                        <h4 class="title">Add new details</h4>
                        <div class="comments-area">
                            <springForm:form action="/checkout" method="post" modelAttribute="checkOutBean">
                                <p>
                                    <label>Full name</label>
                                    <span>*</span>
                                    <springForm:input path="fullName" type="text" value="" />
                                </p>
                                <p>
                                    <label>Phone number</label>
                                    <span>*</span>
                                    <springForm:input path="phoneNumber" type="text" value="" />
                                </p>
                                <p>
                                    <label>City/Province</label>
                                    <span>*</span>
                                    <springForm:input path="city" type="text" value=""/>
                                </p>
                                <p>
                                    <label>Address detail</label>
                                    <span>*</span>
                                    <springForm:input path="addressDetail" type="text" value="" />
                                </p>
                                <p>
                                    <input style="float: left" type="submit" value="Next step: Payment method">
                                </p>
                            </springForm:form>
                        </div>
                    </div>
                </div>
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
