<div class="header-bottom">

    <div class="wrap">
        <!-- start header menu -->
        <ul class="megamenu skyblue">
            <li class="active"><a class="color1" href="">Home</a></li>
            <c:forEach var="item" items="${listCategory}">
            <li class="active grid"><a class="color4" href="<c:url value="/category/${item.categoryUrl}/${item.id}" /> ">${item.categoryName}</a></li>
            </c:forEach>
        </ul>

        <div class="clear"></div>
    </div>
</div>
