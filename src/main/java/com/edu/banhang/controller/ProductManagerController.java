package com.edu.banhang.controller;

import com.edu.banhang.model.Product;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;

@Controller
@RequestMapping(value = "/admin/product")
public class ProductManagerController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${app.image.upload.folder}")
    private String uploadFolder;

    private String IMAGE_PREFIX = "/images/upload/";

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
        PageRequest pageable = new PageRequest(evalPage, 9);
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
    public String save(ModelMap mm, @RequestParam("attachment") MultipartFile file, RedirectAttributes redirectAttributes, @Valid Product product, BindingResult bindingResult) {
        if (product.getCategory() == null || product.getCategory().getId() == -1) {
            bindingResult.rejectValue("category", "NotEmpty.category", "*Please select a category");
        }
        mm.put("listCategory", categoryService.getAll());
        if (file.isEmpty() && (product.getImageUrl() == null || product.getImageUrl().isEmpty())) {
            bindingResult.rejectValue("imageUrl", "NotEmpty.imageUrl", "*Please select an image");
        }

        if (bindingResult.hasErrors()) {
            return "admin/product-form";
        }

        //Image handle
        if (!file.isEmpty()) {
            Date now = new Date();
            String uploadImageFileName = now.getTime() + "-" + file.getOriginalFilename();

            File folder = new File(uploadFolder);
            if (!folder.exists()) {
                folder.mkdirs();
            }
            try {
                byte[] imageBytes = file.getBytes();
                File newImageFile = new File(uploadFolder + uploadImageFileName);
                if (!newImageFile.exists()) {
                    newImageFile.createNewFile();
                }
                Path path = Paths.get(newImageFile.toURI());
                Files.write(path, imageBytes);
            } catch (IOException ex) {
                logger.error("Upload " + uploadFolder + uploadImageFileName + " failed. ", ex);
                bindingResult.rejectValue("imageUrl", "error.imageUrl", "*Error to upload file");
                return "admin/product-form";
            }
            product.setImageUrl(IMAGE_PREFIX + uploadImageFileName);
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
