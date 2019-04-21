package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Category;
import com.edu.banhang.repository.CategoryRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCCategoryRepository extends AbstractJdbcRepository<Category, Long> implements CategoryRepository {
    @Override
    public void initialize() {
        this.tableName = CATEGORY;
        this.idColumn = CATEGORY_ID;
        this.rowMapper = (resultSet, i) -> {
            Category category = new Category();
            category.setId(resultSet.getLong(CATEGORY_ID));
            category.setCategoryName(resultSet.getString(CATEGORY_NAME));
            category.setCategoryUrl(resultSet.getString(CATEGORY_URL));
            category.setCategoryStatus(resultSet.getBoolean(CATEGORY_STATUS));

            return category;
        };

        this.updater = (category, mapping) -> {
            mapping.put(CATEGORY_ID, category.getId());
            mapping.put(CATEGORY_NAME, category.getCategoryName());
            mapping.put(CATEGORY_URL, category.getCategoryUrl());
            mapping.put(CATEGORY_STATUS, category.isCategoryStatus());
        };
    }
}
