package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Comment;
import com.edu.banhang.model.Product;
import com.edu.banhang.model.Role;
import com.edu.banhang.model.User;
import com.edu.banhang.repository.CommentRepository;
import com.edu.banhang.repository.RoleRepository;
import com.edu.banhang.repository.UserRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import com.edu.banhang.repository.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCCommentRepository extends AbstractJdbcRepository<Comment, Long> implements CommentRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void initialize() {

        this.tableName = COMMENT;
        this.idColumn = COMMENT_ID;

        this.rowMapper = (resultSet, i) -> {
            Comment comment = new Comment();
            comment.setId(resultSet.getLong(COMMENT_ID));

            comment.setProduct(new Product());
            comment.getProduct().setId(resultSet.getLong(PRODUCT_ID));

            comment.setCommentDate(resultSet.getTimestamp(COMMENT_DATE));
            comment.setUsername(resultSet.getString(COMMENT_USER_NAME));
            comment.setCommentDescription(resultSet.getString(COMMENT_DESC));
            return comment;
        };

        this.updater = (comment, mapping) -> {
            mapping.put(COMMENT_ID, comment.getId());
            mapping.put(PRODUCT_ID, comment.getProduct().getId());
            mapping.put(COMMENT_DATE, comment.getCommentDate());
            mapping.put(COMMENT_USER_NAME, comment.getUsername());
            mapping.put(COMMENT_DESC, comment.getCommentDescription());
        };
        afterPropertiesSet();
    }


    @Override
    public List<Comment> findCommentByProductId(Long productId) {
        Map<String, Object> columns = new HashMap<>();
        columns.put(PRODUCT_ID, productId);
        return findBy(columns);
    }
}
