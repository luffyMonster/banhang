package com.edu.banhang.service.impl;

import com.edu.banhang.model.Category;
import com.edu.banhang.repository.CategoryRepository;
import com.edu.banhang.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public Category save(Category object) {
        return categoryRepository.save(object);
    }

    @Override
    public void delete(Category object) {
        categoryRepository.delete(object);
    }

    @Override
    public Category findById(long categoryId) {
        return categoryRepository.findOne(categoryId);
    }

    @Override
    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        categoryRepository.findAll().forEach(categories::add);
        return categories;
    }

    @Override
    public Page<Category> findAll(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }
}
