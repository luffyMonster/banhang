package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Category;
import com.edu.banhang.model.Product;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import com.edu.banhang.repository.common.JdbcPage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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

    @Override
    public Page<Product> getProductByCategory(Long categoryId, Pageable pageable) {
        String sql = "select * from " + PRODUCT + " where " + CATEGORY_ID + " = ?";
        final StringBuilder qu = new StringBuilder(sql);

        appendSort(pageable, qu);

        qu
                .append(" limit ")
                .append(pageable.getOffset())
                .append(", ")
                .append(pageable.getPageSize())
                .append(" ");
        String sqlCount = "select count(*) from " + PRODUCT + " where " + CATEGORY_ID + " = ?";
        Object[] params = new Object[]{categoryId};
        long count = count(params, sqlCount);
        int totalPages = (int) count / pageable.getPageSize();
        if (totalPages*pageable.getPageSize() != count) {
            totalPages += 1;
        }
        return new JdbcPage<>(pageable,
                totalPages,
                (int) count,
                jdbcTemplate.query(qu.toString(), params, this.rowMapper));
    }

    @Override
    public Page<Product> findProductByName(String name, Pageable pageable) {
        String sql = "select * from " + PRODUCT + " where " + PRODUCT_NAME + " like concat('%', concat(?,'%'))" ;
        final StringBuilder qu = new StringBuilder(sql);

        appendSort(pageable, qu);

        qu
                .append(" limit ")
                .append(pageable.getOffset())
                .append(", ")
                .append(pageable.getPageSize())
                .append(" ");
        Object[] params = new Object[]{name};
        String sqlCount = "select count(*) from " + PRODUCT + " where " + PRODUCT_NAME + " like concat('%', concat(?,'%'))" ;
        long count = count(params, sqlCount);
        int totalPages = (int) count / pageable.getPageSize();
        if (totalPages*pageable.getPageSize() != count) {
            totalPages += 1;
        }
        return new JdbcPage<>(pageable,
                totalPages,
                (int) count,
                jdbcTemplate.query(qu.toString(), params, this.rowMapper));
    }

    private void appendSort(Pageable pageable, StringBuilder qu) {
        Optional.ofNullable(pageable.getSort()).ifPresent(sort -> {
            String separator = " ";
            qu.append(" order by");
            for (Sort.Order o : sort) {
                qu
                        .append(separator)
                        .append(o.getProperty())
                        .append(" ")
                        .append(o.getDirection().toString());
                separator = ", ";
            }
        });
    }

    private long count(Object[] params, String sql) {
        Long count = jdbcTemplate.queryForObject(sql, params, Long.class);
        return count == null ? 0 : count;
    }
}
