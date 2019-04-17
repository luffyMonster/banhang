package com.edu.banhang.controller;

import com.edu.banhang.model.CheckOutBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class ShoppingCartController {
    private static Logger LOGGER = LoggerFactory.getLogger(ShopController.class);

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
}
