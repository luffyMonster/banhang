<%--
  Created by IntelliJ IDEA.
  User: To Nghia
  Date: 4/15/2019
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Free Adidas Website</title>
    <%@include file="fragments/common-header.jsp" %>
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/easy-responsive-tabs.css">
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<div class="main">
    <div class="login">
        <div class="wrap">
            <!-- tittle heading -->
            <h2 class="form-title">Payment
                <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
            </h2>
            <!-- //tittle heading -->
            <div class="checkout-right">
                <!--Horizontal Tab-->
                <div id="parentHorizontalTab">
                    <ul class="resp-tabs-list hor_1">
                        <li>Cash on delivery (COD)</li>
                        <li>Credit/Debit</li>
                    </ul>
                    <div class="resp-tabs-container hor_1">

                        <div>

                            <div class="vertical_post check_box_agile">
                                <h5>COD</h5>
                                <div class="checkbox">
                                    <div class="check_box_one cashon_delivery">
                                        <label class="anim">
                                            <span> We also accept Credit/Debit card on delivery. Please Check with the agent.</span>
                                        </label>
                                    </div>
                                </div>
                                <form action="">
                                    <button type="submit" class="btn btn2" style="margin-top: 30px">
                                        <span>Check out </span>
                                    </button>
                                </form>

                            </div>
                        </div>
                        <div>
                            <form action="#" method="post" class="creditly-card-form agileinfo_form">
                                <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                                    <div class="credit-card-wrapper">
                                        <div class="first-row form-group">
                                            <div class="controls">
                                                <label class="control-label">Name on Card</label>
                                                <input class="billing-address-name form-control" type="text" name="name"
                                                       placeholder="John Smith">
                                            </div>
                                            <div class="w3_agileits_card_number_grids">
                                                <div class="w3_agileits_card_number_grid_left">
                                                    <div class="controls">
                                                        <label class="control-label">Card Number</label>
                                                        <input class="number credit-card-number form-control"
                                                               type="text" name="number" inputmode="numeric"
                                                               autocomplete="cc-number"
                                                               autocompletetype="cc-number"
                                                               x-autocompletetype="cc-number"
                                                               placeholder="&#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149; &#149;&#149;&#149;&#149;">
                                                    </div>
                                                </div>
                                                <div class="w3_agileits_card_number_grid_right">
                                                    <div class="controls">
                                                        <label class="control-label">CVV</label>
                                                        <input class="security-code form-control" Â· inputmode="numeric"
                                                               type="text" name="security-code"
                                                               placeholder="&#149;&#149;&#149;">
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="controls">
                                                <label class="control-label">Expiration Date</label>
                                                <input class="expiration-month-and-year form-control" type="text"
                                                       name="expiration-month-and-year" placeholder="MM / YY">
                                            </div>
                                        </div>
                                        <button class="submit">
                                            <span>Make a payment </span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--Plug-in Initialisation-->
            </div>
        </div>
    </div>
</div>

<%@include file="fragments/footer.jsp" %>
<script src="js/easyResponsiveTabs.js"></script>
<script>
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>

<!-- credit-card -->
<script src="js/creditly.js"></script>
<link rel="stylesheet" href="css/creditly.css" type="text/css" media="all"/>

<script>
    $(function () {
        var creditly = Creditly.initialize(
            '.creditly-wrapper .expiration-month-and-year',
            '.creditly-wrapper .credit-card-number',
            '.creditly-wrapper .security-code',
            '.creditly-wrapper .card-type');

        $(".creditly-card-form .submit").click(function (e) {
            e.preventDefault();
            var output = creditly.validate();
            if (output) {
                // Your validated credit card output
                console.log(output);
            }
        });
    });
</script>
<!-- //credit-card -->
</body>
</html>