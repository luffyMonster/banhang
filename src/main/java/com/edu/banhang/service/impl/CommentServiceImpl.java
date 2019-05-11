package com.edu.banhang.service.impl;

import com.edu.banhang.model.Comment;
import com.edu.banhang.repository.CommentRepository;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    private CommentRepository commentRepository;
    private ProductRepository productRepository;

    public CommentServiceImpl(CommentRepository commentRepository, ProductRepository productRepository) {
        this.commentRepository = commentRepository;
        this.productRepository = productRepository;
    }

    @Override
    public List<Comment> findCommentByProductId(Long productId) {
        List<Comment> ret = commentRepository.findCommentByProductId(productId);
        ret.forEach(comment -> comment.setProduct(productRepository.findOne(comment.getId())));
        return ret;
    }

    public Comment save(Comment comment) {
        commentRepository.save(comment);
        return comment;
    }
}
