package com.edu.banhang.repository;

import com.edu.banhang.model.Category;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface CategoryRepository extends PagingAndSortingRepository<Category, Long> {
}
