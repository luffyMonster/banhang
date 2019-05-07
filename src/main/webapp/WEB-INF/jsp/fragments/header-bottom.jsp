<div class="header-bottom">

    <div class="wrap">
        <!-- start header menu -->
        <ul class="megamenu skyblue">
            <li class="active"><a class="color12" href="<c:url value="/" />">Home</a></li>
            <c:forEach var="item" items="${listCategory}" varStatus="loop">
            <li class="active grid"><a class="color${loop.index%12+1}" href="<c:url value="/category/${item.categoryUrl}/${item.id}" /> ">${item.categoryName}</a></li>
            </c:forEach>
        </ul>

        <div class="clear"></div>
    </div>
</div>
