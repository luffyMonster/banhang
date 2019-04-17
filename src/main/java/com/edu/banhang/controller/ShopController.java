package com.edu.banhang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {
    private static Logger LOGGER = LoggerFactory.getLogger(ShopController.class);

    @GetMapping("/shop")
    public String shop() {

        return "shop";
    }
}
