package com.edu.banhang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class LoginController {
    private static Logger Logger = LoggerFactory.getLogger(ShopController.class);

    @GetMapping("/login")
    public String login(Principal principal) {
        if (principal != null) {
            Logger.info("Logged. Redirect to homepage");
            return "redirect:/home";
        }
        return "login";
    }
}
