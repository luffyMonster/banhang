package com.edu.banhang.controller;

import com.edu.banhang.model.Cart;
import com.edu.banhang.model.CheckOutBean;
import com.edu.banhang.model.Product;
import com.edu.banhang.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/cart")
public class ShoppingCartController {
    private static Logger logger = LoggerFactory.getLogger(ShopController.class);

    ProductService productService;

    @Autowired
    public ShoppingCartController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/checkout")
    public ModelAndView checkOutStep1() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("checkout");
        modelAndView.addObject("checkOutBean", new CheckOutBean());
        return modelAndView;
    }

    @PostMapping("/checkout")
    public String checkOutStep2(@Valid CheckOutBean checkOutBean) {
        return "payment";
    }

    @GetMapping("")
    public String viewCart(HttpSession session) {
        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }

        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "cart";
    }

    @GetMapping("/add/{productId}")
    public String addToCart(HttpSession session, @PathVariable Long productId) {
        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Product product = productService.findById(productId);
        if (product != null) {
            if (cartItems.containsKey(productId)) {
                Cart item = cartItems.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                cartItems.put(productId, item);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuantity(1);
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "cart";
    }

    @GetMapping("/remove/{productId}")
    public String removeFromCart(HttpSession session, @PathVariable Long productId) {
        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        cartItems.remove(productId);

        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "cart";
    }


    private BigDecimal totalPrice(HashMap<Long, Cart> cartItems) {
        BigDecimal count = BigDecimal.valueOf(0);
        for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
            count = count.add(list.getValue().getProduct().getPrice().multiply(new BigDecimal(list.getValue().getQuantity())));
        }
        return count;
    }
}
