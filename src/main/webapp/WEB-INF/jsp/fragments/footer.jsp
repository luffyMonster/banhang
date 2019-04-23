<%@ page contentType="text/html;charset=UTF-8" %>
<div class="footer">
    <div class="footer-top">
        <div class="wrap">
            <div class="col_1_of_footer-top span_1_of_footer-top">
                <ul class="f_list">
                    <li><img src="<c:url value='/images/f_icon.png' />" alt=""/><span class="delivery">Free delivery on all orders over $100*</span></li>
                </ul>
            </div>
            <div class="col_1_of_footer-top span_1_of_footer-top">
                <ul class="f_list">
                    <li><img src="<c:url value='/images/f_icon1.png' />" alt=""/><span class="delivery">Customer Service :<span class="orange"> (800) 000-2587 (freephone)</span></span></li>
                </ul>
            </div>
            <div class="col_1_of_footer-top span_1_of_footer-top">
                <ul class="f_list">
                    <li><img src="<c:url value='/images/f_icon2.png' />" alt=""/><span class="delivery">Fast delivery & free returns</span></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="copy">
        <div class="wrap">
            <p>© All rights reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {

        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };


        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
