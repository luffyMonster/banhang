<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Free Adidas Website </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@include file="fragments/common-header.jsp"%>
    <link href="<c:url value='/css/user.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="<c:url value='fonts/material-icon/css/material-design-iconic-font.min.css' />">
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<div class="main">
    <div class="register_account">
        <section class="signup">
            <div class="container">
                <c:if test="${errorMessage != null}">
                    <div class="alert alert-error">${errorMessage}</div>
                </c:if>
                <c:if test="${successMessage != null}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <c:url value="/register" var="registerUrl" />
                        <s:form method="POST" action="${registerUrl}" modelAttribute="user" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <s:input type="text" path="name" id="name" placeholder="Your Name"/>
                                <s:errors cssClass="error" path="name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <s:input type="email" path="email" id="email" placeholder="Your Email"/>
                                <s:errors cssClass="error" path="email"/>
                            </div>
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-assignment-account"></i></label>
                                <s:input type="text" path="username" id="username" placeholder="Username"/>
                                <s:errors cssClass="error" path="username"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <s:input type="password" path="password" id="pass" placeholder="Password"/>
                                <s:errors cssClass="error" path="password"/>
                            </div>
                            <div class="form-group">
                                <label for="address"><i class="zmdi zmdi-city"></i></label>
                                <s:input type="text" path="address" id="address" placeholder="Your Address"/>
                                <s:errors cssClass="error" path="address"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </s:form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="<c:url value='/images/signup-image.jpg' />" alt="sing up image"></figure>
                        <a href="<c:url value='/login' /> " class="signup-image-link">I am already member?</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<%@include file="fragments/footer.jsp" %>

</body>
</html>
