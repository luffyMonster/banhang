package com.edu.banhang.service.impl;

import com.edu.banhang.model.Category;
import com.edu.banhang.model.Product;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.service.CategoryService;
import com.edu.banhang.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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
        return productRepository.getProductByCategory(categoryId, pageable);
    }


}
