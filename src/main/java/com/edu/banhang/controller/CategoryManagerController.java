package com.edu.banhang.controller;

import com.edu.banhang.model.Category;
import com.edu.banhang.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping(value = "/admin/category")
public class CategoryManagerController {

    private CategoryService categoryService;

    @Autowired
    public CategoryManagerController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping(value = "/list")
    public String listFirst(ModelMap mm) {
        return list(mm, Optional.of(1));
    }

    @RequestMapping(value = "/list/{page}")
    public String list(ModelMap mm, @PathVariable Optional<Integer> page) {
        int evalPage = (page.orElse(0) < 1) ? 0 : page.get() - 1;
        PageRequest pageable = new PageRequest(evalPage, 10);
        Page<Category> categoryPage = categoryService.findAll(pageable);
        mm.put("listCategory", categoryPage.getContent());
        mm.put("totalPage", categoryPage.getTotalPages());
        return "admin/category-list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String viewAdd(ModelMap mm) {
        mm.put("category", new Category());
        return "admin/category-form";
    }

    @RequestMapping(value = "edit/{categoryId}", method = RequestMethod.GET)
    public String viewProductEdit(ModelMap mm, @PathVariable("categoryId") long categoryId) {
        Category category = categoryService.findById(categoryId);
        mm.put("category", category);
        return "admin/category-form";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@Valid Category category, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "admin/category-form";
        }
        categoryService.save(category);
        redirectAttributes.addFlashAttribute("category", category);
        redirectAttributes.addFlashAttribute("successMessage", "Operation successfully.");
        return "redirect:/admin/category/edit/" + category.getId();

    }

    @RequestMapping(value = "remove/{categoryId}", method = RequestMethod.GET)
    public String viewProductRemove(ModelMap mm, @PathVariable("categoryId") long categoryId) {
        Category category = categoryService.findById(categoryId);
        if (category != null) {
            category.setCategoryStatus(false);
            categoryService.save(category);
        }
        return listFirst(mm);
    }
}
