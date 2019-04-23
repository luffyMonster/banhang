<jsp:useBean id="prod" type="com.edu.banhang.model.Product"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col_1_of_3 span_1_of_3"><a href="<c:url value='/product/${prod.id}' />">
    <div class="view view-fifth">
        <div class="top_box">
            <h3 class="m_1">${prod.name}</h3>
            <p class="m_2">${fn:substring(prod.description, 0, 50)}</p>
            <div class="grid_img">
                <div class="css3"><img src="<c:url value='${prod.imageUrl}' />" alt="${prod.name}"/></div>
                <div class="mask">
                    <div class="info">Quick View</div>
                </div>
            </div>
            <div class="price">${prod.price}$</div>
        </div>
    </div>
    <ul class="list add-to-cart">
        <li>
            <img src="<c:url value='/images/plus.png' />" alt=""/>
            <ul class="icon1 sub-icon1 profile_img">
                <li>
                    <a class="active-icon c1" href="<c:url value='/cart/add/${prod.id}' /> ">Add To Cart </a>
                </li>
            </ul>
        </li>
    </ul>
    <div class="clear"></div>
</a></div>
