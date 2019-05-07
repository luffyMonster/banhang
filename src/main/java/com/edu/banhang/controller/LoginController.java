package com.edu.banhang.controller;

import com.edu.banhang.service.CategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
public class LoginController {
    private static Logger Logger = LoggerFactory.getLogger(ShopController.class);

    private CategoryService categoryService;

    public LoginController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/login")
    public String login(ModelMap mm, Principal principal) {
        if (principal != null) {
            Logger.info("Logged. Redirect to homepage");
            return "redirect:/home";
        }
        mm.addAttribute("listCategory", categoryService.getAll());
        return "login";
    }
}
