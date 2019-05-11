<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <li>
                                    <a href="<c:url value="/category/${item.categoryUrl}/${item.id}" /> ">${item.categoryName}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <div class="cont span_2_of_3">
            <div class="labout span_1_of_a1">
                <!-- start product_slider -->
                <ul id="etalage" style="height: 414px">
                    <li style="height: 100%">
                        <div style="display: flex; align-items: center; height: 100%">
                            <img class="etalage_thumb_image" src="<c:url value="${product.imageUrl}" />"/>
                            <img class="etalage_source_image" src="<c:url value="${product.imageUrl}" />"/>
                        </div>
                    </li>
                </ul>


                <!-- end product_slider -->
            </div>
            <div class="cont1 span_2_of_a1">
                <h3 class="m_3">${product.name}</h3>

                <div class="price_single">
                    <span class="actual">$${product.price}</span>
                </div>
                <a style="float: none; margin-bottom: 20px;" class="btn btn1"
                   href="<c:url value="/cart/add/${product.id}" /> ">Buy now</a>
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

            <div class="toogle">
                <h3 class="m_3">Product Reviews</h3>
                <div class="comment_block">
                    <c:if test="${listComment == null || listComment.size() == 0}">
                        <div style="margin-left: 10px; font-size: 0.9em; color: #999">
                            This product don't have review yet.
                        </div>
                    </c:if>
                    <c:forEach var="commment" items="${listComment}">
                        <div class="new_comment">
                            <ul class="user_comment">
                                <div class="comment_body">
                                    <p>${commment.commentDescription}</p>
                                </div>
                                <div class="comment_toolbar">
                                    <div class="comment_details">
                                        <ul>
                                            <li><i class="zmdi zmdi-time"></i> <fmt:formatDate type="time"
                                                                                               value="${commment.commentDate}"/>
                                            </li>
                                            <li><i class="zmdi zmdi-calendar-note"></i> <fmt:formatDate
                                                    pattern="yyyy/MM/dd"
                                                    value="${commment.commentDate}"/></li>
                                            <li><i class="zmdi zmdi-edit"></i> <span class="user">
                                                <c:choose>
                                                    <c:when test="${commment.username != null}"> ${commment.username}</c:when>
                                                    <c:otherwise>Unknown user</c:otherwise>
                                                </c:choose>
                                            </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ul>
                        </div>
                    </c:forEach>
                    <div class="create_new_comment">
                        <c:url var="commentUrl" value="/comment" />
                        <form action="${commentUrl}" method="post">
                            <input type="hidden" name="product.id" value="${product.id}">
                            <div class="input_comment">
                                <textarea rows="4" name="commentDescription" placeholder="Enter review...."></textarea>
                            </div>
                            <button class="btn btn1" style="float: none; margin-left: 10px; width: auto" type="submit">
                                Add Review
                            </button>
                        </form>
                    </div>
                </div>
                <style>
                    .comment_block .create_new_comment {
                        width: 100%;
                        padding: 20px 0;
                    }

                    .create_new_comment .input_comment textarea {
                        width: calc(100% - 55px);
                        margin-left: 10px;
                        font-family: inherit;
                        border: 1px solid #eee;
                    }

                    .comment_block .create_new_comment .input_comment textarea:focus {
                        outline: none;
                        border-bottom: 2px solid #e6e6e6;
                    }

                    .comment_block .new_comment {
                        width: 100%;
                        height: auto;
                        padding: 5px 0;
                    }

                    .comment_block .new_comment .user_comment {
                        list-style-type: none;
                    }

                    .comment_block .new_comment .comment_body {
                        display: inline-block;
                        vertical-align: middle;
                        width: calc(100% - 75px);
                        min-height: 50px;
                        margin-left: 10px;
                        padding: 5px 10px;
                        font-size: .9rem;
                        color: #555;
                        background-color: #fafafa;
                        border-bottom: 2px solid #f2f2f2;
                    }

                    .comment_block .new_comment .comment_toolbar {
                        width: 100%;
                    }

                    .comment_block .new_comment .comment_toolbar ul {
                        list-style-type: none;
                        padding-left: 75px;
                        font-size: 0;
                    }

                    .comment_block .new_comment .comment_toolbar ul li {
                        display: inline-block;
                        padding: 5px;
                        font-size: .7rem;
                        color: #d9d9d9;
                    }

                    .comment_block .new_comment .comment_toolbar ul li:hover {
                        cursor: pointer;
                    }

                    .comment_block .new_comment .comment_toolbar .comment_details {
                        display: inline-block;
                        vertical-align: middle;
                        width: 70%;
                        text-align: left;
                    }

                </style>
            </div>
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
    jQuery(document).ready(function ($) {

        $('#etalage').etalage({
            thumb_image_width: 300,
            thumb_image_height: 'auto',
            source_image_width: 700,
            source_image_height: 'auto',
            show_hint: true,
            click_callback: function (image_anchor, instance_id) {
                alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
            }
        });
        // This is for the dropdown list example:
        $('.dropdownlist').change(function () {
            etalage_show($(this).find('option:selected').attr('class'));
        });

    });
</script>
<!----//details-product-slider--->

</body>
</html>
