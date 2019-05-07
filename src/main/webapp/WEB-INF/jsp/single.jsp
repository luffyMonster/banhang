<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Free Adidas Website </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <%@include file="fragments/common-header.jsp" %>
    <link rel="stylesheet" href="<c:url value='/css/form.css' />">
    <link rel="stylesheet" href="<c:url value='/fonts/material-icon/css/material-design-iconic-font.min.css' />">
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<div class="single">
    <div class="wrap">
        <div class="rsidebar span_1_of_left">
            <section class="sky-form">
                <h4>Category</h4>
                <div class="row row1 scroll-pane" style="padding: 0">
                    <div class="col col-4">
                        <ul class="list-nav">
                        <c:forEach var="item" items="${listCategory}" varStatus="loop">
                            <li><a href="<c:url value="/category/${item.categoryUrl}/${item.id}" /> ">${item.categoryName}</a></li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <div class="cont span_2_of_3">
            <div class="labout span_1_of_a1">
                <!-- start product_slider -->
                <ul id="etalage">
                    <li>
                        <img class="etalage_thumb_image" src="<c:url value="${product.imageUrl}" />"/>
                        <img class="etalage_source_image" src="<c:url value="${product.imageUrl}" />"/>
                    </li>
                </ul>


                <!-- end product_slider -->
            </div>
            <div class="cont1 span_2_of_a1">
                <h3 class="m_3">${product.name}</h3>

                <div class="price_single">
                    <span class="actual">$${product.price}</span>
                </div>
                <a style="float: none; margin-bottom: 20px;" class="btn btn1" href="<c:url value="/cart/add/${product.id}" /> ">Buy now</a>
                <p class="m_desc">${product.description}</p>

            </div>
            <div class="clear"></div>
            <ul id="flexiselDemo3">
                <c:forEach var="item" items="${listProduct}">
                    <li><img src="<c:url value="${item.imageUrl}"/> " alt="${item.name}"/>
                        <div class="grid-flex"><a href="<c:url value="/single/${item.id}" /> ">${item.name}</a></div>
                    </li>
                </c:forEach>
            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo1").flexisel();
                    $("#flexiselDemo2").flexisel({
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                    $("#flexiselDemo3").flexisel({
                        visibleItems: 5,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="<c:url value="/js/jquery.flexisel.js" />"></script>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>

<%@include file="fragments/footer.jsp" %>

<!----details-product-slider--->
<!-- Include the Etalage files -->
<link rel="stylesheet" href="<c:url value="/css/etalage.css" />">
<script src="<c:url value="/js/jquery.etalage.min.js" />"></script>
<!-- Include the Etalage files -->
<script>
    jQuery(document).ready(function($){

        $('#etalage').etalage({
            thumb_image_width: 300,
            thumb_image_height: 400,

            show_hint: true,
            click_callback: function(image_anchor, instance_id){
                alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
            }
        });
        // This is for the dropdown list example:
        $('.dropdownlist').change(function(){
            etalage_show( $(this).find('option:selected').attr('class') );
        });

    });
</script>
<!----//details-product-slider--->

</body>
</html>
