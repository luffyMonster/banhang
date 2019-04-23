<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>navigation</title>
    </head>
    <body>

        <div class="sidebar-menu">
            <div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
                    <!--<img id="logo" src="" alt="Logo"/>-->
                </a> </div>
            <div class="menu">
                <ul id="menu" >
                    <li><a href="<c:url value="/admin/category/list"/>" title="Category"><i class="fa fa-tags"></i><span>Category</span></a></li>
                    <li><a href="<c:url value="/admin/product/list" />" title="Product"><i class="fa fa-copy"></i><span>Product</span></a></li>
                    <li><a href="<c:url value="/admin/order/list" />"   title="Order"><i class="fa fa-opencart"></i><span>Order</span></a></li>
                    <li><a href="<c:url value="/admin/report/receipt" />" title="Report"><i class="fa fa-bar-chart"></i><span>Report</span></a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"> </div>

        <!--slide bar menu end here-->
        <script>
            var toggle = true;

            $(".sidebar-icon").click(function () {
                if (toggle)
                {
                    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                    $("#menu span").css({"position": "absolute"});
                } else
                {
                    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                    setTimeout(function () {
                        $("#menu span").css({"position": "relative"});
                    }, 400);
                }
                toggle = !toggle;
            });
        </script>

    </body>
</html>
