package com.edu.banhang.controller;

import com.edu.banhang.model.Product;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

import static com.edu.banhang.constant.DBConstants.PRODUCT_ID;
import static com.edu.banhang.constant.DBConstants.PRODUCT_NAME;

@Controller
public class ShopController {
    private static Logger LOGGER = LoggerFactory.getLogger(ShopController.class);


    private ProductService productService;
    private CategoryService categoryService;

    @Autowired
    public ShopController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @GetMapping("/shop")
    public String shop() {
        return "shop";
    }

    @GetMapping(value = "/single/{productId}")
    public String single(ModelMap mm, @PathVariable long productId) {
        Product product = productService.findById(productId);
        Page<Product> productPage = productService.findAll(new PageRequest(1, 10
                , new Sort(new Sort.Order(Sort.Direction.DESC, PRODUCT_ID), new Sort.Order(Sort.Direction.ASC, PRODUCT_NAME))));
        mm.addAttribute("listCategory", categoryService.getAll());
        mm.addAttribute("product", product);
        mm.addAttribute("listProduct", productPage.getContent());
        return "single";
    }

    @GetMapping(value = "/category/{categoryUrl}/{categoryId}")
    public String showProductsByCategory(ModelMap mm, @PathVariable String categoryUrl, @PathVariable Long categoryId) {
        return showProductsByCategoryPage(mm, categoryUrl, categoryId, Optional.of(1));
    }

    @GetMapping(value ="/category/{categoryUrl}/{categoryId}/{page}")
    public String showProductsByCategoryPage(ModelMap mm, @PathVariable String categoryUrl, @PathVariable Long categoryId, @PathVariable Optional<Integer> page) {
        int evalPage = (page.orElse(0) < 1) ? 0 : page.get() - 1;
        PageRequest pageable = new PageRequest(evalPage, 9);
        Page<Product> productPage = productService.getProductByCategory(categoryId, pageable);
        mm.put("category", categoryService.findById(categoryId));
        mm.put("listProduct", productPage.getContent());
        mm.put("totalPage", productPage.getTotalPages());
        mm.addAttribute("listCategory", categoryService.getAll());
        return "shop";
    }

}
