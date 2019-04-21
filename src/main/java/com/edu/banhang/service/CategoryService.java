package com.edu.banhang.service;

import com.edu.banhang.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CategoryService {
    Category save(Category object);

    void delete(Category object);

    Category findById(long categoryId);

    List<Category> getAll();

    Page<Category> findAll(Pageable pageable);
}
