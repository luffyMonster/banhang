package com.edu.banhang.controller;

import com.edu.banhang.repository.ProductRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ShopController {
    private static Logger LOGGER = LoggerFactory.getLogger(ShopController.class);


    ProductRepository productRepository;

    @Autowired
    public ShopController(ProductRepository p) {
        this.productRepository  = p;
    }


    @GetMapping("/shop")
    public String shop() {
        return "shop";
    }

    @GetMapping(value = "/product/{producId}")
    public String single(ModelMap mm, @PathVariable  long productId) {
        return null;
    }

}
