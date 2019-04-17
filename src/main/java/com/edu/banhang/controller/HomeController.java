package com.edu.banhang.controller;

import com.edu.banhang.model.Product;
import com.edu.banhang.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static com.edu.banhang.constant.DBConstants.PRODUCT_ID;
import static com.edu.banhang.constant.DBConstants.PRODUCT_NAME;

@Controller
public class HomeController {

    private final ProductService productService;

    @Value("${app.home.size-per-page}")
    private int sizePerPerPage;
    private static final int INITIAL_PAGE = 0;

    @Autowired
    public HomeController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping({"/", "/home"})
    public ModelAndView home(Optional<Integer> page) {

        // Evaluate page. If requested parameter is null or less than 0 (to
        // prevent exception), return initial size. Otherwise, return value of
        // param. decreased by 1.
        int evalPage = (page.orElse(0) < 1) ? INITIAL_PAGE : page.get() - 1;

        Page<Product> productPages = productService.findAll(new PageRequest(evalPage, sizePerPerPage
                                                                , new Sort(new Sort.Order(Sort.Direction.DESC, PRODUCT_ID), new Sort.Order(Sort.Direction.ASC, PRODUCT_NAME))));

        List<Product> products = new ArrayList<>();
        if (productPages != null) products = productPages.getContent();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("products", products);
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
