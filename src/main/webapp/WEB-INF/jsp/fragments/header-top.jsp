<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="header-top">
    <div class="wrap">
        <div class="logo">
            <a href="<c:url value='/home'/>"><img src="images/logo.png" alt=""/></a>
        </div>
        <div class="cssmenu">
            <ul>
                <sec:authorize access="!isAuthenticated()">
                    <li class="active"><a href="<c:url value='/register'/>">Sign up</a></li>
                    <li class="active"><a href="<c:url value='/login'/>">Log in</a></li>
                </sec:authorize>
                <li><a href="<c:url value='/shop'/>">Store Locator</a></li>
                <li><a href="<c:url value='/checkout'/>">Cart & Checkout</a></li>
                <sec:authorize access="isAuthenticated()">
                    <li><a href="<c:url value='/logout'/>"><sec:authentication property="principal.username" />, logout!</a></li>
                </sec:authorize>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>