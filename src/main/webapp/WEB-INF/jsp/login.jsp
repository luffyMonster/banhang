<%--
  Created by IntelliJ IDEA.
  User: To Nghia
  Date: 4/14/2019
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <link href="css/user.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
</head>
<body>
<%@include file="fragments/header-top.jsp" %>
<%@include file="fragments/header-bottom.jsp" %>

<div class="main">
    <section class="sign-in" style="margin-top: 20px">
        <div class="container">
            <c:if test="${param.error != null}">
                <div class="alert alert-error">Invalid username and password.</div>
            </c:if>
            <c:if test="${param.logout != null}">
                <div class="alert alert-error">You have been logged out.</div>
            </c:if>
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                    <a href="<c:url value='/register' />" class="signup-image-link">Create an account</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Sign in</h2>
                    <form method="POST" action="/login" class="register-form" id="login-form">
                        <div class="form-group">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="username" id="username" placeholder="UserName"/>
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Password"/>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="fragments/footer.jsp" %>

</body>
</html>