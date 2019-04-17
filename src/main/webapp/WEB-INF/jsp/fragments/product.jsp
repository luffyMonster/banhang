<jsp:useBean id="prod" type="com.edu.banhang.model.Product"/>
<%--
  Created by IntelliJ IDEA.
  User: To Nghia
  Date: 4/14/2019
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col_1_of_3 span_1_of_3"><a href="single.html">
    <div class="view view-fifth">
        <div class="top_box">
            <h3 class="m_1">${prod.name}</h3>
            <p class="m_2">${prod.description}</p>
            <div class="grid_img">
                <div class="css3"><img src="${prod.imageUrl}" alt="${prod.name}"/></div>
                <div class="mask">
                    <div class="info">Quick View</div>
                </div>
            </div>
            <div class="price">${prod.price}$</div>
        </div>
    </div>
    <span class="rating">
				        <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1">
				        <label for="rating-input-1-5" class="rating-star1"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1">
				        <label for="rating-input-1-4" class="rating-star1"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1">
				        <label for="rating-input-1-3" class="rating-star1"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1">
				        <label for="rating-input-1-2" class="rating-star"></label>
				        <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1">
				        <label for="rating-input-1-1" class="rating-star"></label>&nbsp;
		        	  (45)
		    	      </span>
    <ul class="list">
        <li>
            <img src="images/plus.png" alt=""/>
            <ul class="icon1 sub-icon1 profile_img">
                <li>
                    <a class="active-icon c1" href="#">Add To Bag </a>
                </li>
            </ul>
        </li>
    </ul>
    <div class="clear"></div>
</a></div>