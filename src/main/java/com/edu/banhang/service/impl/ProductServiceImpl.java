package com.edu.banhang.service.impl;

import com.edu.banhang.model.Category;
import com.edu.banhang.model.Product;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryService categoryService;

    @Override
    public Page<Product> findAll(Pageable pageable) {
        Page<Product> page = productRepository.findAll(pageable);
        page.getContent().forEach(product -> {
            Category category = categoryService.findById(product.getCategory().getId());
            product.setCategory(category);
        });
        return  page;
    }

    @Override
    public Product findById(Long id) {
        Product product = productRepository.findOne(id);
        Category category = categoryService.findById(product.getCategory().getId());
        product.setCategory(category);

        return product;
    }

    @Override
    public Product save(Product product) {
        productRepository.save(product);
        Category category = categoryService.findById(product.getCategory().getId());
        product.setCategory(category);

        return product;
    }

    @Override
    public void delete(long productId) {
        productRepository.delete(productId);
    }

    @Override
    public Page<Product> getProductByCategory(Long categoryId, Pageable pageable) {
        Page<Product> page = productRepository.getProductByCategory(categoryId, pageable);
        page.getContent().forEach(product -> {
            Category category = categoryService.findById(product.getCategory().getId());
            product.setCategory(category);
        });
        return page;
    }

    @Override
    public List<Product> getListProductToShowBanner() {
        List<Category> categories = categoryService.getAll();
        List<Product> ret = new ArrayList<>();
        categories.forEach(category -> {
            Page<Product> productPage = productRepository.getProductByCategory(category.getId(), new PageRequest(0, 1));
            if (!productPage.getContent().isEmpty()) {
                productPage.getContent().forEach(product -> {
                    product.setCategory(category);
                    ret.add(product);
                });
            }
        });
        return ret;
    }

    @Override
    public Page<Product> findProductByName(String name, Pageable pageable) {
        Page<Product> page = productRepository.findProductByName(name, pageable);
        page.getContent().forEach(product -> {
            Category category = categoryService.findById(product.getCategory().getId());
            product.setCategory(category);
        });
        return page;
    }


}
