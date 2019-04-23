package com.edu.banhang.controller;

import com.edu.banhang.model.Category;
import com.edu.banhang.model.Product;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping(value = "/admin/product")
public class ProductManagerController {

    private ProductService productService;

    private CategoryService categoryService;

    @Autowired
    public ProductManagerController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }

    @RequestMapping(value = "/list")
    public String viewProductListZero(ModelMap mm) {
        return viewProductList(mm, Optional.of(1));
    }

    @RequestMapping(value = "/list/{page}")
    public String viewProductList(ModelMap mm, @PathVariable Optional<Integer> page) {
        int evalPage = (page.orElse(0) < 1) ? 0 : page.get() - 1;
        PageRequest pageable = new PageRequest(evalPage, 10);
        Page<Product> productPage = productService.findAll(pageable);
        mm.put("listProduct", productPage.getContent());
        mm.put("totalPage", productPage.getTotalPages());
        return "admin/product-list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String viewAdd(ModelMap mm) {
        mm.put("product", new Product());
        mm.put("listCategory", categoryService.getAll());
        return "admin/product-form";
    }

    @RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
    public String viewProductEdit(ModelMap mm, @PathVariable("productId") long productId) {
        Product p = productService.findById(productId);
        mm.put("product", p);
        mm.put("listCategory", categoryService.getAll());
        return "admin/product-form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam("attachment") MultipartFile file, @Valid Product product, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (product.getCategory() == null || product.getCategory().getId() == -1) {
            bindingResult.addError(new ObjectError("category", "*Please select a category"));
        }
        if (bindingResult.hasErrors()) {
            return "admin/product-form";
        }
        productService.save(product);
        redirectAttributes.addFlashAttribute("product", product);
        redirectAttributes.addFlashAttribute("listCategory", categoryService.getAll());
        redirectAttributes.addFlashAttribute("successMessage", "Operation successfully!");
        return "redirect:/admin/product/edit/" + product.getId();
    }

    @RequestMapping(value = "remove/{productId}", method = RequestMethod.GET)
    public String viewProductRemove(ModelMap mm, @PathVariable("productId") long productId) {
        Product p = productService.findById(productId);
        if (p != null) {
            productService.delete(p.getId());
        }
        return viewProductListZero(mm);
    }
}
