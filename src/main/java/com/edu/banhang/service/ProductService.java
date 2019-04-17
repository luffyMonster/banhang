package com.edu.banhang.service;

import com.edu.banhang.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface ProductService {
    Page<Product> findAll(Pageable pageable);
}