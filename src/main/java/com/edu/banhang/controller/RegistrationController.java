package com.edu.banhang.controller;

import com.edu.banhang.model.User;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class RegistrationController {
    Logger logger = LoggerFactory.getLogger(this.getClass());
    private final UserService userService;
    private final CategoryService categoryService;

    @Autowired
    public RegistrationController(UserService userService, CategoryService categoryService) {
        this.userService = userService;
        this.categoryService = categoryService;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("register");
        modelAndView.addObject("listCategory", categoryService.getAll());
        return modelAndView;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {
        if (userService.findByEmail(user.getEmail()).isPresent()) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }
        if (userService.findByUsername(user.getUsername()).isPresent()) {
            bindingResult
                    .rejectValue("username", "error.user",
                            "There is already a user registered with the username provided");
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("listCategory", categoryService.getAll());

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("register");
        } else {
            // Registration successful, save user
            // Set user role to USER and set it as active
            try {
                userService.saveUser(user);
            } catch (Exception ex) {
                logger.error(ex.getMessage(), ex);
                modelAndView.setViewName("register");
                modelAndView.addObject("errorMessage", "System can't created new user for some reason. Please contact the administrator.");
                return  modelAndView;
            }

            modelAndView.addObject("successMessage", "User has been registered successfully.");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }


}
