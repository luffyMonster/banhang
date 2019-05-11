package com.edu.banhang.repository;

import com.edu.banhang.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;


public interface ProductRepository extends PagingAndSortingRepository<Product, Long> {
    Page<Product> getProductByCategory(Long categoryId, Pageable pageable);
    Page<Product> findProductByName(String name, Pageable pageable);
}
