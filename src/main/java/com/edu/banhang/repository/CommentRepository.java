package com.edu.banhang.repository;

import com.edu.banhang.model.Comment;
import com.edu.banhang.model.Product;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface CommentRepository extends PagingAndSortingRepository<Comment, Long> {
    List<Comment> findCommentByProductId(Long productId);
}
