package com.edu.banhang.controller;

import com.edu.banhang.model.*;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.ProductService;
import com.edu.banhang.service.ReceiptItemService;
import com.edu.banhang.service.ReceiptService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/cart")
public class ShoppingCartController {
    private static Logger logger = LoggerFactory.getLogger(ShopController.class);

    ProductService productService;

    ReceiptService receiptService;

    ReceiptItemService receiptItemService;

    CategoryService categoryService;

    @Autowired
    public ShoppingCartController(ProductService productService, ReceiptService receiptService, ReceiptItemService receiptItemService, CategoryService categoryService) {
        this.productService = productService;
        this.receiptService = receiptService;
        this.receiptItemService = receiptItemService;
        this.categoryService = categoryService;
    }

    @GetMapping("/checkout")
    public ModelAndView checkOutStep1(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("checkout");
        modelAndView.addObject("checkOutBean", new CheckOutBean());
        modelAndView.addObject("listCategory", categoryService.getAll());
        return modelAndView;
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String checkOutStep2(ModelMap mm, HttpSession session, @Valid CheckOutBean checkOutBean, BindingResult bindingResult) {
        mm.addAttribute("listCategory", categoryService.getAll());
        if (bindingResult.hasErrors()) {
            return "checkout";
        }
        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null || cartItems.isEmpty()) {
            mm.addAttribute("errorMessage", "Can not check out when your cart is empty.");
            return "forward:/cart";
        }
        Receipt receipt = new Receipt();
        receipt.setReceiptName(checkOutBean.getFullName());
        receipt.setReceiptAddress(checkOutBean.getAddress());
        receipt.setPhoneNumber(checkOutBean.getPhoneNumber());
        receipt.setReceiptDate(new Timestamp(new Date().getTime()));
        receipt.setReceiptStatus(false);
        receiptService.save(receipt);

        for (Map.Entry<Long, Cart> entry : cartItems.entrySet()) {
            ReceiptItem receiptItem = new ReceiptItem();
            receiptItem.setReceipt(receipt);
            receiptItem.setProduct(entry.getValue().getProduct());
            receiptItem.setReceiptItemPrice(entry.getValue().getProduct().getPrice());
            receiptItem.setReceiptItemQuantity(entry.getValue().getQuantity());
            receiptItemService.save(receiptItem);
        }
        cartItems = new HashMap<>();
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", 0);
        session.setAttribute("myCartNum", 0);

        mm.addAttribute("successMessage", "Your order has been successfully processed! Your products will arrive at your destination as soon as possible");
        return "cart";
    }

    @GetMapping("")
    public String viewCart(HttpSession session, ModelMap mm) {
        HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        mm.addAttribute("listCategory", categoryService.getAll());
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
        return "redirect:/cart";
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
        return "redirect:/cart";
    }


    private BigDecimal totalPrice(HashMap<Long, Cart> cartItems) {
        BigDecimal count = BigDecimal.valueOf(0);
        for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
            count = count.add(list.getValue().getProduct().getPrice().multiply(new BigDecimal(list.getValue().getQuantity())));
        }
        return count;
    }
}
