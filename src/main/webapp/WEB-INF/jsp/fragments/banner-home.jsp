<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="index-banner">
    <div class="wmuSlider example1" style="height: 220px">
        <div class="wmuSliderWrapper">
            <c:forEach var="product" items="${listBanner}">
                <article style="position: relative; width: 100%; opacity: 1;">
                    <div class="banner-wrap">
                        <div class="slider-left" style="display: flex; height: 100%; align-items: center">
                            <img src="<c:url value="${product.imageUrl}" /> " alt="${product.name}" />
                        </div>
                        <div class="slider-right"  >
                            <h2>${product.category.categoryName}</h2>
                            <p>${product.name}</p>
                            <div class="btn"><a href="<c:url value="/category/${product.category.categoryUrl}/${product.category.id}" />">Shop Now</a></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </article>
            </c:forEach>
        </div>
        <a class="wmuSliderPrev">Previous</a><a class="wmuSliderNext">Next</a>
        <ul class="wmuSliderPagination">
            <c:forEach var="product" items="${listBanner}" varStatus="loop">
                <li><a href="#" class="<c:if  test="${loop.first}" >wmuActive</c:if>">${loop.index}</a></li>
            </c:forEach>
        </ul>
    </div>
    <script src="<c:url value="/js/jquery.wmuSlider.js" />"></script>
    <script type="text/javascript" src="<c:url value="/js/modernizr.custom.min.js" />"></script>
    <script>
        $('.example1').wmuSlider();
    </script>
</div>
