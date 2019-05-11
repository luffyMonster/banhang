package com.edu.banhang.controller;

import com.edu.banhang.model.Comment;
import com.edu.banhang.model.Product;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.CommentService;
import com.edu.banhang.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static com.edu.banhang.constant.DBConstants.PRODUCT_ID;
import static com.edu.banhang.constant.DBConstants.PRODUCT_NAME;

@Controller
public class ShopController {

    private ProductService productService;
    private CategoryService categoryService;
    private CommentService commentService;

    @Autowired
    public ShopController(ProductService productService, CategoryService categoryService, CommentService commentService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.commentService = commentService;
    }

    @GetMapping("/shop")
    public String shop(ModelMap mm, @PathVariable Optional<Integer> page) {
        int evalPage = (page.orElse(0) < 1) ? 0 : page.get() - 1;
        PageRequest pageable = new PageRequest(evalPage, 9);
        Page<Product> productPage = productService.findAll(pageable);
        mm.put("navTitle", "All");
        mm.put("listProduct", productPage.getContent());
        mm.put("totalPage", productPage.getTotalPages());
        mm.addAttribute("listCategory", categoryService.getAll());
        return "shop";
    }

    @GetMapping("/product/search")
    public String search(ModelMap mm, @RequestParam String key, @RequestParam Optional<Integer> page) {
        int evalPage = (page.orElse(0) < 1) ? 0 : page.get() - 1;
        PageRequest pageable = new PageRequest(evalPage, 9);
        Page<Product> productPage = productService.findProductByName(key, pageable);
        mm.put("navTitle", "Search for: " + key);
        mm.put("isSearchPage", true);
        mm.put("keyword", key);
        mm.put("listProduct", productPage.getContent());
        mm.put("totalPage", productPage.getTotalPages());
        mm.addAttribute("listCategory", categoryService.getAll());
        return "shop";
    }

    @GetMapping(value = "/single/{productId}")
    public String single(ModelMap mm, @PathVariable long productId) {
        Product product = productService.findById(productId);
        Page<Product> productPage = productService.findAll(new PageRequest(0, 10
                , new Sort(new Sort.Order(Sort.Direction.DESC, PRODUCT_ID), new Sort.Order(Sort.Direction.ASC, PRODUCT_NAME))));

        mm.addAttribute("listCategory", categoryService.getAll());
        mm.addAttribute("product", product);
        mm.addAttribute("listProduct", productPage.getContent());
        mm.addAttribute("listComment", commentService.findCommentByProductId(productId));
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

    @PostMapping(value = "/comment")
    public String addComment(Authentication authentication, Comment comment) {
        if (authentication !=  null) {
            comment.setUsername(authentication.getName());
        }
        comment.setCommentDate(new Date());
        commentService.save(comment);
        return "redirect:/single/" + comment.getProduct().getId();
    }

}
