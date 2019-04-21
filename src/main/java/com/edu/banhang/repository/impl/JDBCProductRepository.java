package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Category;
import com.edu.banhang.model.Product;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import org.springframework.stereotype.Repository;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCProductRepository extends AbstractJdbcRepository<Product, Long> implements ProductRepository {
    @Override
    public void initialize() {
        this.rowMapper = (resultSet, i) -> {
            Product p = new Product();
            p.setId(resultSet.getLong(PRODUCT_ID));
            p.setName(resultSet.getString(PRODUCT_NAME));
            p.setDescription(resultSet.getString(PRODUCT_DESCRIPTION));
            p.setQuantity(resultSet.getInt(PRODUCT_QUANTITY));
            p.setPrice(resultSet.getBigDecimal(PRODUCT_PRICE));
            p.setImageUrl(resultSet.getString(PRODUCT_IMAGE_URL));

            p.setCategory(new Category());
            p.getCategory().setId(resultSet.getLong(CATEGORY_ID));

            return p;
        };
        this.tableName = PRODUCT;
        this.idColumn = PRODUCT_ID;
        this.updater = (p, mapping) -> {
            mapping.put(PRODUCT_ID, p.getId());
            mapping.put(PRODUCT_NAME, p.getName());
            mapping.put(PRODUCT_DESCRIPTION, p.getDescription());
            mapping.put(PRODUCT_QUANTITY, p.getQuantity());
            mapping.put(PRODUCT_PRICE, p.getPrice());
            mapping.put(PRODUCT_IMAGE_URL, p.getImageUrl());
            mapping.put(CATEGORY_ID, p.getCategory().getId());
        };
        afterPropertiesSet();
    }
}
