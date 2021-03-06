<%--
  Created by IntelliJ IDEA.
  User: To Nghia
  Date: 4/15/2019
  Time: 2:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="<c:url value='/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<c:url value='/js/jquery.min.js' />"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".dropdown img.flag").addClass("flagvisibility");

        $(".dropdown dt a").click(function () {
            $(".dropdown dd ul").toggle();
        });

        $(".dropdown dd ul li a").click(function () {
            var text = $(this).html();
            $(".dropdown dt a span").html(text);
            $(".dropdown dd ul").hide();
            $("#result").html("Selected value is: " + getSelectedValue("sample"));
        });

        function getSelectedValue(id) {
            return $("#" + id).find("dt a span.value").html();
        }

        $(document).bind('click', function (e) {
            var $clicked = $(e.target);
            if (!$clicked.parents().hasClass("dropdown"))
                $(".dropdown dd ul").hide();
        });


        $("#flagSwitcher").click(function () {
            $(".dropdown img.flag").toggleClass("flagvisibility");
        });
    });
</script>
<!-- start menu -->
<link href="<c:url value='/css/megamenu.css' />" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="<c:url value='/js/megamenu.js' />"></script>
<script>$(document).ready(function () {
    $(".megamenu").megamenu();
});</script>
<!-- end menu -->
<!-- top scrolling -->
<script type="text/javascript" src="<c:url value='/js/move-top.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/easing.js' />"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
        });
    });
</script>
