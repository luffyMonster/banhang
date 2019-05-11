<div class="header-bottom">

    <div class="wrap">
        <!-- start header menu -->
        <ul class="megamenu skyblue">
            <li class="active"><a class="color12" href="<c:url value="/" />">Home</a></li>
            <c:forEach var="item" items="${listCategory}" varStatus="loop">
            <li class="active grid"><a class="color${loop.index%12+1}" href="<c:url value="/category/${item.categoryUrl}/${item.id}" /> ">${item.categoryName}</a></li>
            </c:forEach>
            <li class="active grid" style="float: right;">
                <c:url value="/product/search" var="searchUrl" />
                <form class="__search" action="${searchUrl}">
                    <input type="text" class="searchTerm" name="key" placeholder="Search..."/>
                    <button type="submit" class="searchButton"><i class="zmdi zmdi-search"></i></button>
                </form>
                <style>
                    .__search {
                        width: 100%;
                        position: relative;
                        display: flex;
                        height: 25px;
                        padding: 8px 20px;
                    }

                    .searchTerm {
                        width: 100%;
                        border: 1px solid #ffffff;
                        border-right: none;
                        padding: 5px;
                        border-radius: 5px 0 0 5px;
                        outline: none;
                        color: #9DBFAF;
                    }

                    .searchButton {
                        width: 30px;
                        height: 25px;
                        border: 1px solid #ffffff;
                        background: #1d1c1c;
                        text-align: center;
                        color: #fff;
                        border-radius: 0 5px 5px 0;
                        cursor: pointer;
                        font-size: 20px;
                    }
                </style>
            </li>
        </ul>

        <div class="clear"></div>
    </div>
</div>
