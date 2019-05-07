<jsp:useBean id="prod" type="com.edu.banhang.model.Product"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col_1_of_3 span_1_of_3"><a href="<c:url value='/single/${prod.id}' />">
    <div class="view view-fifth">
        <div class="top_box">
            <h3 class="m_1">${prod.name}</h3>
            <p class="m_2">${fn:substring(prod.description, 0, 30)}<c:if
                    test="${prod.description.length()>30}">...</c:if></p>
            <div class="grid_img">
                <div class="css3"><img src="<c:url value='${prod.imageUrl}' />" alt="${prod.name}"/></div>
                <div class="mask">
                    <div class="info">Quick View</div>
                </div>
            </div>
            <div class="price">${prod.price}$</div>
        </div>
    </div>
    <div class="list add-to-cart">
        <a class="active-icon c1" href="<c:url value='/cart/add/${prod.id}' /> ">Add To Cart </a>
    </div>
    <div class="clear"></div>
</a></div>
